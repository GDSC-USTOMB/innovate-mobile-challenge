import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:noteapp/bloc/save_new_note/save_new_note_bloc.dart';
import 'package:noteapp/models/note.dart';

import '../widgets/go_back_button.dart';
import '../widgets/square_icon_button.dart';

class NewNoteScreen extends StatefulWidget {
  const NewNoteScreen({super.key});

  @override
  State<NewNoteScreen> createState() => _NewNoteScreenState();
}

class _NewNoteScreenState extends State<NewNoteScreen> {
  late final TextEditingController titleController;
  late final TextEditingController noteController;
  late final SaveNewNoteBloc bloc;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    noteController = TextEditingController();
    bloc = GetIt.I.get<SaveNewNoteBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SaveNewNoteBloc>(
      create: (context) => bloc,
      child: BlocListener<SaveNewNoteBloc, SaveNewNoteState>(
        listener: (context, state) {
          if (state is SaveNewNoteSuccess) context.pop();
        },
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 75,
            leading: const GoBackButton(),
            actions: [
              SquareIconButton(
                icon: const Icon(Icons.visibility_outlined),
                onPressed: () {},
              ),
              const SizedBox(width: 25),
              SaveButton(
                titleController: titleController,
                noteController: noteController,
                bloc: bloc,
              ),
              const SizedBox(width: 25),
            ],
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 40),
                  TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                      border: InputBorder.none,
                    ),
                    maxLines: null,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 40),
                  TextField(
                    controller: noteController,
                    decoration: const InputDecoration(
                      hintText: 'Note',
                      border: InputBorder.none,
                    ),
                    style: Theme.of(context).textTheme.bodyLarge,
                    maxLines: null,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
    required this.titleController,
    required this.noteController,
    required this.bloc,
  });

  final TextEditingController titleController;
  final TextEditingController noteController;
  final SaveNewNoteBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveNewNoteBloc, SaveNewNoteState>(
      builder: (context, state) {
        if (state is SaveNewNoteInProgress) {
          return const CircularProgressIndicator.adaptive();
        }
        return SquareIconButton(
          icon: const Icon(Icons.save_outlined),
          onPressed: () {
            if (titleController.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('The title cannot be empty')),
              );
              return;
            }
            final Note note = Note(
              title: titleController.text,
              content: noteController.text,
            );
            bloc.add(SaveNewNote(note: note));
          },
        );
      },
    );
  }
}

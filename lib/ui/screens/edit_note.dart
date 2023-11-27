import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/update_note/update_note_bloc.dart';
import '../../models/note.dart';
import '../widgets/go_back_button.dart';
import '../widgets/square_icon_button.dart';

class EditNote extends StatefulWidget {
  final Note oldNote;
  const EditNote(
    this.oldNote, {
    super.key,
  });

  @override
  State<EditNote> createState() => _EditNoteState();
}

class _EditNoteState extends State<EditNote> {
  late final UpdateNoteBloc bloc;
  late final TextEditingController titleController;
  late final TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    bloc = GetIt.I.get<UpdateNoteBloc>();
    titleController = TextEditingController(text: widget.oldNote.title);
    contentController = TextEditingController(text: widget.oldNote.content);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UpdateNoteBloc>(
      create: (context) => bloc,
      child: BlocListener<UpdateNoteBloc, UpdateNoteState>(
        listener: (context, state) {
          if (state is UpdateNoteInSuccess) context.pop();
        },
        child: Scaffold(
          appBar: AppBar(
            leadingWidth: 75,
            leading: const GoBackButton(),
            actions: [
              SquareIconButton(
                icon: const Icon(Icons.visibility_outlined),
                onPressed: () => context.push(
                  '/NoteView',
                  extra: Note(
                    title: titleController.text,
                    content: contentController.text,
                  ),
                ),
              ),
              const SizedBox(width: 25),
              SaveButton(
                titleController: titleController,
                noteController: contentController,
                bloc: bloc,
                oldNote: widget.oldNote,
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
                    controller: contentController,
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
    required this.oldNote,
  });

  final Note oldNote;
  final TextEditingController titleController;
  final TextEditingController noteController;
  final UpdateNoteBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateNoteBloc, UpdateNoteState>(
      builder: (context, state) {
        if (state is UpdateNoteInProgress) {
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
            final Note newNote = Note(
              title: titleController.text,
              content: noteController.text,
            );
            bloc.add(UpdateNote(oldNote: oldNote, newNote: newNote));
          },
        );
      },
    );
  }
}

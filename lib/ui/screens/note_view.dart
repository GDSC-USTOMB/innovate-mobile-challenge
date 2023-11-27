import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:noteapp/ui/widgets/square_icon_button.dart';

import '../../models/note.dart';
import '../widgets/go_back_button.dart';

class NoteView extends StatelessWidget {
  final Note note;

  const NoteView({
    required this.note,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 75,
        leading: const GoBackButton(),
        actions: [
          SquareIconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => context
                .push(
                  '/NoteView/EditNote',
                  extra: note,
                )
                .then((value) => context.pop()),
          ),
          const SizedBox(width: 25),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 40),
              Text(
                note.title,
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: null,
              ),
              const SizedBox(height: 40),
              Text(
                note.content,
                style: Theme.of(context).textTheme.bodyLarge,
                maxLines: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

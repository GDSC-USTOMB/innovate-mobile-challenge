import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../models/note.dart';

class NoteTile extends StatelessWidget {
  final Note note;
  final Color cardColor;

  const NoteTile(
    this.note, {
    required this.cardColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.push(
        '/NoteView',
        extra: note,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 46,
        vertical: 22,
      ),
      tileColor: cardColor,
      title: Text(
        note.title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.black,
              fontSize: 25,
            ),
      ),
    );
  }
}

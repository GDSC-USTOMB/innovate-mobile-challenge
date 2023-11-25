import 'package:flutter/material.dart';

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
    return Container(
      clipBehavior: Clip.hardEdge,
      padding: const EdgeInsets.symmetric(
        horizontal: 46,
        vertical: 22,
      ),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      constraints: const BoxConstraints(
        minWidth: double.infinity,
      ),
      child: Text(
        note.title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.black,
              fontSize: 25,
            ),
      ),
    );
  }
}

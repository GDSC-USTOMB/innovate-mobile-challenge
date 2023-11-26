import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../data/interfaces/notes_repository.dart';
import '../../models/note.dart';
import 'note_tile.dart';

const List<Color> colors = [
  Color(0xFFFD99FF),
  Color(0xFFFF9E9E),
  Color(0xFF91F48F),
  Color(0xFFFFF599),
  Color(0xFF9EFFFF),
  Color(0xFFB69CFF),
];

class NotesListView extends StatelessWidget {
  const NotesListView({
    super.key,
    required this.refreshIndicatorKey,
    required this.notes,
  });

  final GlobalKey<RefreshIndicatorState> refreshIndicatorKey;
  final List<Note> notes;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: notes.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 25,
      ),
      itemBuilder: (context, index) {
        return Dismissible(
          key: ValueKey(notes[index]),
          background: Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.delete,
              size: 48,
            ),
          ),
          onDismissed: (_) {
            GetIt.I
                .get<NotesRepository>()
                .deleteNote(notes[index])
                .then((value) {
              final message = value != null
                  ? value.message
                  : "Note was deleted successfully";
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message)),
              );
              refreshIndicatorKey.currentState?.show();
            });
          },
          child: NoteTile(
            notes[index],
            cardColor: colors[index % colors.length],
          ),
        );
      },
    );
  }
}
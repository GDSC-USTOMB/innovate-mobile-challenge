part of 'save_new_note_bloc.dart';

sealed class SaveNewNoteEvent extends Equatable {
  const SaveNewNoteEvent();

  @override
  List<Object> get props => [];
}

class SaveNewNote extends SaveNewNoteEvent {
  final Note note;

  const SaveNewNote({required this.note});

  @override
  List<Object> get props => [note];
}

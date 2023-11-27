part of 'update_note_bloc.dart';

sealed class UpdateNoteEvent extends Equatable {
  const UpdateNoteEvent();

  @override
  List<Object> get props => [];
}

final class UpdateNote extends UpdateNoteEvent {
  final Note oldNote;
  final Note newNote;

  const UpdateNote({
    required this.oldNote,
    required this.newNote,
  });

  @override
  List<Object> get props => [oldNote, newNote];
}

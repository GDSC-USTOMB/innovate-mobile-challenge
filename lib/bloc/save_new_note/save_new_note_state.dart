part of 'save_new_note_bloc.dart';

sealed class SaveNewNoteState extends Equatable {
  const SaveNewNoteState();

  @override
  List<Object> get props => [];
}

final class SaveNewNoteInitial extends SaveNewNoteState {}

final class SaveNewNoteInProgress extends SaveNewNoteState {}

final class SaveNewNoteSuccess extends SaveNewNoteState {}

final class SaveNewNoteFailure extends SaveNewNoteState {
  final Failure failure;

  const SaveNewNoteFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

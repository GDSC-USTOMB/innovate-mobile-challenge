part of 'update_note_bloc.dart';

sealed class UpdateNoteState extends Equatable {
  const UpdateNoteState();

  @override
  List<Object> get props => [];
}

final class UpdateNoteInitial extends UpdateNoteState {}

final class UpdateNoteInProgress extends UpdateNoteState {}

final class UpdateNoteInSuccess extends UpdateNoteState {}

final class UpdateNoteInFailure extends UpdateNoteState {
  final Failure failure;

  const UpdateNoteInFailure(this.failure);
}

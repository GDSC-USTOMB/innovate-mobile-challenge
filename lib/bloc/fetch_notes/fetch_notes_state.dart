part of 'fetch_notes_bloc.dart';

sealed class FetchNotesState extends Equatable {
  const FetchNotesState();

  @override
  List<Object> get props => [];
}

final class FetchNotesInitial extends FetchNotesState {}

final class FetchNotesInProgress extends FetchNotesState {}

final class FetchNotesSuccess extends FetchNotesState {
  final List<Note> notes;

  const FetchNotesSuccess(this.notes);

  @override
  List<Object> get props => [notes];
}

final class FetchNotesFailure extends FetchNotesState {
  final Failure failure;

  const FetchNotesFailure(this.failure);

  @override
  List<Object> get props => [failure];
}

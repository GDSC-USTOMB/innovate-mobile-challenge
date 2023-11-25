part of 'fetch_notes_bloc.dart';

sealed class FetchNotesEvent extends Equatable {
  const FetchNotesEvent();

  @override
  List<Object> get props => [];
}

final class FetchNotes extends FetchNotesEvent {}

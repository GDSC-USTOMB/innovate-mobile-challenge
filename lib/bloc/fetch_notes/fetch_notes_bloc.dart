import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../data/interfaces/notes_repository.dart';
import '../../models/failure.dart';
import '../../models/note.dart';

part 'fetch_notes_event.dart';
part 'fetch_notes_state.dart';

class FetchNotesBloc extends Bloc<FetchNotesEvent, FetchNotesState> {
  final NotesRepository repository;
  FetchNotesBloc({
    required this.repository,
  }) : super(FetchNotesInitial()) {
    on<FetchNotes>((event, emit) async {
      emit(FetchNotesInProgress());
      final result = await repository.getNotes();
      if (result.isSuccess()) {
        emit(FetchNotesSuccess((result as Success).success));
      } else {
        emit(FetchNotesFailure((result as Error).error));
      }
    });
  }
}

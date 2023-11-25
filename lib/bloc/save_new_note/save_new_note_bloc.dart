import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/interfaces/notes_repository.dart';
import '../../models/failure.dart';
import '../../models/note.dart';

part 'save_new_note_event.dart';
part 'save_new_note_state.dart';

class SaveNewNoteBloc extends Bloc<SaveNewNoteEvent, SaveNewNoteState> {
  final NotesRepository repository;
  SaveNewNoteBloc({required this.repository}) : super(SaveNewNoteInitial()) {
    on<SaveNewNote>((event, emit) async {
      emit(SaveNewNoteInProgress());
      final result = await repository.addNote(event.note);
      emit(result == null ? SaveNewNoteSuccess() : SaveNewNoteFailure(result));
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:noteapp/data/interfaces/notes_repository.dart';
import 'package:noteapp/models/failure.dart';

import '../../models/note.dart';

part 'update_note_event.dart';
part 'update_note_state.dart';

class UpdateNoteBloc extends Bloc<UpdateNoteEvent, UpdateNoteState> {
  final NotesRepository repository;
  UpdateNoteBloc({
    required this.repository,
  }) : super(UpdateNoteInitial()) {
    on<UpdateNote>((event, emit) async {
      emit(UpdateNoteInProgress());
      final failure = await repository.updateNote(event.oldNote, event.newNote);
      emit(failure != null
          ? UpdateNoteInFailure(failure)
          : UpdateNoteInSuccess());
    });
  }
}

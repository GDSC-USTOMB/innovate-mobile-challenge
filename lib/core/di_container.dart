import 'package:get_it/get_it.dart';
import 'package:noteapp/bloc/fetch_notes/fetch_notes_bloc.dart';

import '../bloc/save_new_note/save_new_note_bloc.dart';
import '../data/implementation/local_notes_repository.dart';
import '../data/interfaces/notes_repository.dart';

void setupLocator() {
  final getIt = GetIt.I;

  getIt.registerLazySingleton<NotesRepository>(
    () => LocalNotesRepository(),
  );

  getIt.registerFactory(
    () => SaveNewNoteBloc(repository: getIt()),
  );

  getIt.registerFactory(
    () => FetchNotesBloc(repository: getIt()),
  );
}

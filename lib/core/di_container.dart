import 'package:get_it/get_it.dart';

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
}

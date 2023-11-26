import 'package:multiple_result/multiple_result.dart';

import '../../models/note.dart';
import '../../models/failure.dart';

abstract interface class NotesRepository {
  Future<Result<List<Note>, Failure>> getNotes();
  Future<Result<List<Note>, Failure>> searchNotes(String keyword);
  Future<Failure?> addNote(Note note);
  Future<Failure?> deleteNote(Note note);
}

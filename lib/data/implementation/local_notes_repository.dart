import 'package:multiple_result/multiple_result.dart';
import 'package:noteapp/models/failure.dart';

import 'package:noteapp/models/note.dart';
import 'package:sqflite/sqflite.dart';

import '../interfaces/notes_repository.dart';

class LocalNotesRepository implements NotesRepository {
  static const _name = "NotesDatabase.db";
  static const tableName = 'notes';
  static const _version = 1;

  Database? _database;

  initDatabase() async {
    if (_database != null) return;
    _database = await openDatabase(_name, version: _version,
        onCreate: (Database db, int version) async {
      await db.execute(
        '''CREATE TABLE $tableName (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    title TEXT,
                    content TEXT
                    )''',
      );
    });
  }

  @override
  Future<Failure?> addNote(Note note) async {
    await initDatabase();
    await _database!.insert(
      tableName,
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return null;
  }

  @override
  Future<Failure?> deleteNote(Note note) async {
    await _database!.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [note.id],
    );
    return null;
  }

  @override
  Future<Result<List<Note>, Failure>> getNotes() async {
    await initDatabase();
    final query = await _database!.query(tableName);
    final notes = query.map((note) => Note.fromMap(note)).toList();
    return Success(notes);
  }

  @override
  Future<Result<List<Note>, Failure>> searchNotes(String keyword) async {
    await initDatabase();

    var res = await _database!.rawQuery(
      "SELECT * FROM notes WHERE title LIKE ?",
      ['%$keyword%'],
    );
    final notes = res.map((note) => Note.fromMap(note)).toList();
    return Success(notes);
  }
}

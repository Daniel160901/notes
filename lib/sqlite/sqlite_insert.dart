import 'package:notes_bloc/sqlite/sqlite_helper.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:sqflite/sqflite.dart';
import 'package:notes_bloc/sqlite/model/note.dart';


class SQLiteInsert {
  Future<void> note(Note note) async {
    final Database db = await SQLiteHelper.getDB();
    await db.insert("notes", note.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
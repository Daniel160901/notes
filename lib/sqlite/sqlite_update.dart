import 'package:notes_bloc/sqlite/sqlite_helper.dart';
import 'package:sqflite/sqflite.dart';

import 'model/note.dart';

class SQLiteUpdate {
  Future<void> note(Note note) async {
    final Database db = await SQLiteHelper.getDB();
    await db.update(
      "notes",
      note.toMap(),
      where: "id=?",
      whereArgs: [note.id],
    );
  }
}

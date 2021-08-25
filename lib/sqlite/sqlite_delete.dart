import 'package:notes_bloc/sqlite/model/note.dart';
import 'package:notes_bloc/sqlite/sqlite_helper.dart';
import 'package:sqflite/sqflite.dart';

class SQLiteDelete {
  Future<void> note(Note note) async {
    final Database db = await SQLiteHelper.getDB();
    await db.delete(
      "notes",
      where: "id=?",
      whereArgs: [note.id],
    );
  }
}

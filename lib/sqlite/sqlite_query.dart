
import 'package:flutter/material.dart';
import 'package:notes_bloc/sqlite/sqlite_helper.dart';
import 'package:sqflite/sqflite.dart';

import 'model/note.dart';

class SQLiteQuery with ChangeNotifier {
  late List<Note> _notes;

  List<Note> get notes => [...?_notes];

  Future<void> updateNotes() async {
    final Database db = await SQLiteHelper.getDB();
    final List<Map<String, dynamic>> maps = await db.query("notes");
    _notes = List.generate(maps.length, (i) {
      return Note(
        id: maps[i]['id'],
        name: maps[i]['name'],
        description: maps[i]['description'],
      );
    });
    notifyListeners();
  }
}

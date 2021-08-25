import 'package:flutter/material.dart';
import 'package:notes_bloc/constant/routes.dart';
import 'package:notes_bloc/home/add_note.dart';
import 'package:notes_bloc/home/note_list.dart';
import 'package:notes_bloc/sqlite/sqlite_query.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>SQLiteQuery()),
      ],
      child: MaterialApp(
        title: 'Notes',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.home,
        routes: {
          Routes.home: (context) => NoteList(),
          Routes.addNote: (context) => AddNote(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:notes_bloc/constant/routes.dart';
import 'package:notes_bloc/sqlite/sqlite_delete.dart';
import 'package:notes_bloc/sqlite/sqlite_helper.dart';
import 'package:notes_bloc/sqlite/sqlite_query.dart';
import 'package:provider/provider.dart';

class NoteList extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Notes"),
        ),
      ),
      body: FutureBuilder(
        future: SQLiteHelper.getDB(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done)
            return _showList(context);
          else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()=>_openAddNote(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void _openAddNote(BuildContext context){
    Navigator.pushNamed(context, Routes.addNote).then((value){
      Provider.of<SQLiteQuery>(context, listen: false).updateNotes();
    });
  }

  _showList(BuildContext context){
    final SQLiteQuery sqLiteQuery=Provider.of<SQLiteQuery>(context);
    return ListView.builder(
      itemCount: sqLiteQuery.notes.length,
      itemBuilder: (context, index){
        return ListTile(
            title: Text(sqLiteQuery.notes[index].name),
            subtitle: Text(sqLiteQuery.notes[index].description),
          );
      },
    );
  }
}

/*child: ListTile(
title: Text(sqLiteQuery.notes[index].name),
subtitle: Text(sqLiteQuery.notes[index].description),
),*/
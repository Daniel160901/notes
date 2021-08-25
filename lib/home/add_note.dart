import 'dart:js';

import 'package:flutter/material.dart';
import 'package:notes_bloc/sqlite/model/note.dart';
import 'package:notes_bloc/sqlite/sqlite_insert.dart';

class AddNote extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: _Form(),
    );
  }
}

class _Form extends StatelessWidget{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _idController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 25,
        right: 25,
        left: 25,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                maxLength: 30,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: "Note Description",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _idController,
                decoration: InputDecoration(
                  labelText: "ID Note",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton.icon(
                label: Text("Save"),
                icon: Icon(Icons.save),
                onPressed: ()=>_save(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _save(BuildContext context){
    SQLiteInsert().note(Note(
      name: _nameController.text.trim(),
      description: _descriptionController.text.trim(),
      id: _idController.text.trim(),
    ));
    Navigator.pop(context);
  }


}
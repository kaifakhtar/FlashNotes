
import 'package:flutter/material.dart';
import '../modals/note.dart';
import './query_screen.dart';

class InsertNoteScreen extends StatelessWidget {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.pinkAccent[500],
        //centerTitle: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            "Add Your Note ",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.done_all_sharp))
        ]),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  fillColor: Colors.pink[50],
                  hintText: "Title",
                ),
              ),
              SizedBox(height: 50),
              TextField(
                controller: descController,
                maxLines: 25,
                decoration: InputDecoration(
                  hintText: "Enter your note",
                  fillColor: Colors.pink[50],
                  filled: true,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () =>
              _insertNote(titleController.text, descController.text,context),
          label: Text("Done")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _insertNote(String title, String desc,BuildContext context) {
    //pass row map to query_screen.dart then to database_helper
    Note note = Note.withId(title: title, description: desc);
    Map<String, dynamic> noteMap = note.toJson();
    QueryMiddle queryMiddle = QueryMiddle(); // returns a map
    queryMiddle.insert(noteMap);

    queryMiddle.queryAll();
    Navigator.pop(context,true);
  }
}

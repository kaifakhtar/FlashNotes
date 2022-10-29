import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kins_c/widgets/desc_card_design.dart';
import '../modals/note.dart';
import '../widgets/add_button.dart';
import './query_screen.dart';

class InsertNoteScreen extends StatelessWidget {
  final titleController = TextEditingController();
  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFcffdff),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 40,horizontal: 20),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                border: InputBorder.none,

                  fillColor: Colors.pink[50],
                  hintText: "Title",
                  hintStyle: GoogleFonts.lato(
                    fontSize: 50
                  )
                ),
                cursorColor: Color(0xFFea59f7),
                style: GoogleFonts.lato(
                  fontSize: 40,
                  color: Color(0xFF5493f7)
                ),
              ),
              const SizedBox(height: 50),
              // TextField(
              //   controller: descController,
              //   maxLines: 25,
              //   decoration: InputDecoration(
              //     hintText: "Enter your note",
              //     fillColor: Colors.pink[50],
              //     filled: true,
              //   ),
              // )

            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            _insertNote(titleController.text, descController.text, context),
        label: const Text("Done"),
        icon: const Icon(Icons.done),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _insertNote(String title, String desc, BuildContext context) {
    //pass row map to query_screen.dart then to database_helper
    Note note = Note.withId(title: title, description: desc);
    Map<String, dynamic> noteMap = note.toJson();
    QueryMiddle queryMiddle = QueryMiddle(); // returns a map
    queryMiddle.insert(noteMap);

    queryMiddle.queryAll();
    Navigator.pop(context, true);
  }
}

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kins_c/widgets/chips_importance_row.dart';
import 'package:kins_c/widgets/desc_card_design.dart';
import '../modals/note.dart';
import '../widgets/add_button.dart';
import './query_screen.dart';

class InsertNoteScreen extends StatefulWidget {
  @override
  State<InsertNoteScreen> createState() => _InsertNoteScreenState();
}

class _InsertNoteScreenState extends State<InsertNoteScreen> {
  int? _value = 1;
  final titleController = TextEditingController();

  final descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      backgroundColor: Color(0xffe5feff),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.09, horizontal: height * 0.03),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.pink[50],
                    hintText: "Enter title ...",
                    hintStyle: GoogleFonts.sourceSansPro(fontSize: 40)),
                cursorColor: Color(0xFFea59f7),
                style: GoogleFonts.lato(fontSize: 40, color: Color(0xFF5493f7)),
              ),


               SizedBox(height:height*0.03 ),
              //TODO add chips in here prioroty : important, not Import etc


            ChipsPriority(),
              SizedBox(height:height*0.03 ),

              TextField(
                maxLines: 20,
                //controller: titleController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.pink[50],
                    hintText: "Your note",
                    hintStyle: GoogleFonts.sourceSansPro(fontSize: 25)),
                cursorColor: Color(0xFFea59f7),
                style: GoogleFonts.lato(fontSize: 25, color: Color(0xff3d485d)),
              ),
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

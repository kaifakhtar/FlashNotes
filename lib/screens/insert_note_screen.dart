

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../modals/note.dart';
import './query_screen.dart';
import '../widgets/priority_chip.dart';
class InsertNoteScreen extends StatefulWidget {
  @override
  State<InsertNoteScreen> createState() => _InsertNoteScreenState();
}

class _InsertNoteScreenState extends State<InsertNoteScreen> {

  final titleController = TextEditingController();
  final descController = TextEditingController();

  int selectedPriority=3;


  @override
  Widget build(BuildContext context) {
    var height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return Scaffold(
      backgroundColor: const Color(0xffe5feff),
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
                cursorColor: const Color(0xFFea59f7),
                style: GoogleFonts.lato(fontSize: 40, color: const Color(0xFF5493f7)),
              ),

              SizedBox(height: height * 0.03),
              //TODO add chips in here prioroty : important, not Import etc

              Row(
                children: [


                  GestureDetector(
                    onTap: (){setState((){selectedPriority=1;});},
                      child: PriorityChip(selectedPriority: selectedPriority, ChipText: "Important",chipColor:
                      selectedPriority==1 ?const Color(0xFFf58c87) : const Color(0x00FFFFFF),)),


                  SizedBox(
                    width: height * 0.023,
                  ),

                  GestureDetector(
                      onTap: (){setState((){selectedPriority=2;});},
                      child: PriorityChip(selectedPriority: selectedPriority, ChipText: "Moderate",
                         chipColor: selectedPriority==2 ?const Color(0xFFf5fab1) : const Color(0x00FFFFFF))),
                  SizedBox(
                    width: height * 0.023,
                  ),
                  GestureDetector(
                      onTap: (){setState((){selectedPriority=3;});},
                      child: PriorityChip(selectedPriority: selectedPriority, ChipText: "Least",
                      chipColor: selectedPriority==3 ?const Color(0xFFb1fab8) : const Color(0x00FFFFFF) ,),),
                ],
              ),

              SizedBox(height: height * 0.03),

              TextField(
                maxLines: 20,
                controller: descController,
                //controller: titleController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.pink[50],
                    hintText: "Your note",
                    hintStyle: GoogleFonts.sourceSansPro(fontSize: 25)),
                cursorColor: const Color(0xFFea59f7),
                style: GoogleFonts.lato(fontSize: 25, color: const Color(0xff3d485d)),
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

    if (!(title.isEmpty && desc.isEmpty)) {
      Note note = Note.withId(
          title: title,
          description: desc,
          date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
      priority: selectedPriority);
      Map<String, dynamic> noteMap = note.toJson();
      QueryMiddle queryMiddle = QueryMiddle(); // returns a map
      queryMiddle.insert(noteMap);
    }
    //queryMiddle.queryAll();
    Navigator.pop(context, true);
  }
}

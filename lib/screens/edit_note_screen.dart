import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../modals/note.dart';
import '../widgets/priority_chip.dart';
import './query_screen.dart';
class EditNoteScreen extends StatefulWidget {
 String title,date;
 int selectedPriority;
 String? desc;
 int id;
 late TextEditingController titleController;
 late TextEditingController descController;
 @override
  State<EditNoteScreen> createState() => _EdiNoteScreenState();

 EditNoteScreen({required this.title, required this.desc, required this.date, required this.selectedPriority,required this.id}) {
    titleController = TextEditingController(text: title);
    descController = TextEditingController(text: desc);
 }

}

class _EdiNoteScreenState extends State<EditNoteScreen> {





  @override
  Widget build(BuildContext context) {

    var height = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    var width = (MediaQuery.of(context).size.width);
    return Scaffold(
      backgroundColor:(widget.selectedPriority==1)?const Color(0xffecb6fd):(widget.selectedPriority==2)? const Color(0xffffebcc):const Color(0xFFd9ffb3),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: height * 0.09, horizontal: height * 0.03),
          child: Column(
            children: [
              TextField(
                controller: widget.titleController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.pink[50],

                    hintStyle: GoogleFonts.sourceSansPro(fontSize: 40)),
                cursorColor: const Color(0xFFea59f7),
                style: GoogleFonts.lato(fontSize: 40, color: const Color(0xFF5493f7)),
              ),

              SizedBox(height: height * 0.03),
              //TODO add chips in here prioroty : important, not Import etc

              Row(
                children: [


                  GestureDetector(
                      onTap: (){setState((){widget.selectedPriority=1;});},
                      child: PriorityChip(selectedPriority: widget.selectedPriority, ChipText: "Important",chipColor:
                      widget.selectedPriority==1 ?const Color(0xFFdb4dff) : const Color(0x00FFFFFF),)),


                  SizedBox(
                    width: width * 0.023,
                  ),

                  GestureDetector(
                      onTap: (){setState((){widget.selectedPriority=2;});},
                      child: PriorityChip(selectedPriority: widget.selectedPriority, ChipText: "Moderate",
                          chipColor: widget.selectedPriority==2 ?const Color(0xFFffbf80) : const Color(0x00FFFFFF))),
                  SizedBox(
                    width: width * 0.023,
                  ),
                  GestureDetector(
                    onTap: (){setState((){widget.selectedPriority=3;});},
                    child: PriorityChip(selectedPriority: widget.selectedPriority, ChipText: "Least",
                      chipColor: widget.selectedPriority==3 ?const Color(0xFFb1fab8) : const Color(0x00FFFFFF) ,),),
                ],
              ),

              SizedBox(height: height * 0.03),

              TextField(
                maxLines: 20,
                controller: widget.descController,
                //controller: titleController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    fillColor: Colors.pink[50],
                    hintText: widget.desc,
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
            _update(widget.id,widget.titleController.text, widget.descController.text,widget.selectedPriority, context),
        label: const Text("Done"),
        icon: const Icon(Icons.done),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _update(int id,String title, String desc,int priority, BuildContext context) {
    //pass row map to query_screen.dart then to database_helper

      Note note = Note.withId(
          id: id,
          title: title,
          description: desc,
          date: DateFormat('dd/MM/yyyy').format(DateTime.now()),
          priority: priority);
      Map<String, dynamic> noteMap = note.toJson();
      QueryMiddle queryMiddle = QueryMiddle(); // returns a map
      queryMiddle.update(noteMap);

    //queryMiddle.queryAll();
    Navigator.pop(context, true);
  }
}

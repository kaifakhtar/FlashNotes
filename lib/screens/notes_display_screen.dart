import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kins_c/screens/insert_note_screen.dart';
import 'package:kins_c/widgets/card_design.dart';
import 'package:kins_c/widgets/no_note_display.dart';
import '../modals/note.dart';
import '../widgets/my_app_bar.dart';
import './query_screen.dart';

class NotesDisplayScreen extends StatefulWidget {
  @override
  State<NotesDisplayScreen> createState() => _NotesDisplayScreenState();
}

class _NotesDisplayScreenState extends State<NotesDisplayScreen> {
  List<Note>? notes;





  void initNotes() async {
    QueryMiddle queryMiddle = new QueryMiddle();
    List<Map<String, dynamic>>? response =
        await queryMiddle.queryAll(); // returns list of maps ie rows
    notes = response!.map((e) => Note.fromJson(e)).toList();
    //print(notes);
    updateNoteDisplayScreen();
  }

  void _deleteNote(int id) {
    QueryMiddle queryMiddle = QueryMiddle();
    queryMiddle.delete(id);
    updateNoteDisplayScreen();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey,
    ));
    initNotes();
    return Scaffold(
      backgroundColor: Color(0xFFfcfcfc),
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.only(top: screenHeight*0.01),
            child: Column(
              children: [
                SizedBox(height: screenHeight*0.016,),
                const MyAppbar(),
                 SizedBox(
                  height: screenHeight*0.018,
                ),
                (notes == null) || (notes!.isEmpty)
                    ? const NoNoteBanner()
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ListView.builder(
                              itemCount: notes!.length,
                              itemBuilder: (context, index) {

                                return CardDesign(notes![index], _deleteNote,getChipColor(notes![index].priority));
                              }),
                        ),
                      ),
              ],
            ),
          ),
        ),
        floatingActionButton:  FloatingActionButton(
            elevation: screenHeight*0.02,
            onPressed: () async {
              bool? result = await Navigator.push(context,
                  MaterialPageRoute(builder: (context) => InsertNoteScreen()));
              if (result == true) {
                updateNoteDisplayScreen();
              }
            },
            child: const Icon(Icons.add),
          ),

        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat);
  }

  void updateNoteDisplayScreen() {
    setState(() {});
  }
  
  Color getChipColor(priority){
    if(priority==1){
      return const Color(0xffecb6fd);
    }
    else if(priority==2){
      return const Color(0xffffd699);
    }
    return const Color(0xFFd9ffb3);
  }
}

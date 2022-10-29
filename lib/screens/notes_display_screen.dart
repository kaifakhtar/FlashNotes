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
  final List<Color> cardColorsList = [const Color(0xFFffe9ad),const Color(0xFFeaffd9),const Color(0xFFfae0cf)];
int ind =0;
  // @override
  // // void initState() {
  // //   // TODO: implement initState
  // //   super.initState();
  // //   initNotes();
  // // }



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
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[200],
    ));
    initNotes();
    return Scaffold(
      backgroundColor: Color(0xFFfcfcfc),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Column(
              children: [
                SizedBox(height: 10,),
                MyAppbar(),
                const SizedBox(
                  height: 15,
                ),
                (notes == null) || (notes!.isEmpty)
                    ? NoNoteBanner()
                    : Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Container(
                           // height: 600,
                            child: ListView.builder(
                                itemCount: notes!.length,
                                itemBuilder: (context, index) {
                                  if(ind==3){
                                    ind=0;
                                  }

                                  return CardDesign(notes![index], _deleteNote,cardColorsList[ind++]);
                                }),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          elevation: 8,
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
}

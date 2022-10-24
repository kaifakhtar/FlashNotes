import 'package:flutter/material.dart';
import 'package:kins_c/screens/insert_note_screen.dart';
import 'package:kins_c/widgets/card_design.dart';
import '../modals/note.dart';
import './query_screen.dart';

class NotesDisplayScreen extends StatefulWidget {
  @override
  State<NotesDisplayScreen> createState() => _NotesDisplayScreenState();
}

class _NotesDisplayScreenState extends State<NotesDisplayScreen> {
  List<Note>? notes;

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
      QueryMiddle queryMiddle=QueryMiddle();
       queryMiddle.delete(id);
      updateNoteDisplayScreen();
  }


  @override
  Widget build(BuildContext context) {
    initNotes();
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Notes"),
        ),
        body: (notes == null)||(notes!.isEmpty)
            ? Center(child: Text("Add Note",style: TextStyle(fontSize: 40),))
            : ListView.builder(
                itemCount: notes!.length,
                itemBuilder: (context, index) {
                  return CardDesign(notes![index],_deleteNote);
                }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{
           bool? result=await Navigator.push(context, MaterialPageRoute(builder: (context)=>InsertNoteScreen()));
           if(result==true){updateNoteDisplayScreen();}},
          child: Icon(Icons.add),
          ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }

  void updateNoteDisplayScreen() {
          setState((){});}
  }


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
    print(notes);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    initNotes();
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Notes"),
        ),
        body: notes == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: notes!.length,
                itemBuilder: (context, index) {
                  return CardDesign(notes![index]);
                }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .pushNamed("/insertNote")
                .then((value) => setState(() {}));
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}

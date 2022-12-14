import 'package:flutter/material.dart';
import 'package:kins_c/screens/notes_display_screen.dart';
import 'package:kins_c/widgets/card_design.dart';
import 'screens/insert_note_screen.dart';
import 'screens/query_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.pink, accentColor: Colors.pink),
    routes: {
      '/': (context) => NotesDisplayScreen(),
      '/insertNote': (context) => InsertNoteScreen()
    },
  ));
}


import 'package:flutter/material.dart';
import 'screens/insert_note_screen.dart';
import 'screens/query_screen.dart';
void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.pink,
          accentColor: Colors.pinkAccent[100]
    ),
      routes: {
        '/':(context)=>InsertNoteScreen(),
        '/query':(context)=>QueryScreen()
      },));
}

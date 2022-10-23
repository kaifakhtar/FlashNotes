
import 'package:flutter/material.dart';
import 'screens/insert_note_screen.dart';
import 'screens/query_screen.dart';
void main() {
  runApp(MaterialApp(
      routes: {
        '/':(context)=>InsertNoteScreen(),
        '/query':(context)=>QueryScreen()
      },));
}

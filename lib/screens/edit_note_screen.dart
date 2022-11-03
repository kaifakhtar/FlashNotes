import 'package:flutter/material.dart';

class EditNoteScreen extends StatefulWidget {
  const EditNoteScreen({Key? key}) : super(key: key);

  @override
  State<EditNoteScreen> createState() => _EdiNoteScreenState();
}

class _EdiNoteScreenState extends State<EditNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Edit"),
      ),
    );
  }
}

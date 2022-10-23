import 'package:flutter/material.dart';

class InsertNoteScreen extends StatelessWidget {
  const InsertNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Your Note"),
      ),
    );
  }
}

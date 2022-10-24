import 'package:flutter/material.dart';
import 'package:kins_c/widgets/card_design.dart';

class NotesDisplayScreen extends StatelessWidget {
  const NotesDisplayScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Notes"),
      ),
      body: ListView.builder(
          itemCount: 20, itemBuilder: (
              context, index
              ){
        return CardDesign();
          }),
    );
  }
}

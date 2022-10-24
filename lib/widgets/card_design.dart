import 'package:flutter/material.dart';

import '../modals/note.dart';

class CardDesign extends StatelessWidget {

  Note note;

  CardDesign(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 50,
      child: Card(
        color: Colors.pinkAccent[50],
        child: Column(
          children: [
            Text(note.title),
            Text(note.description??"No description"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Icon(Icons.note_alt_rounded), Text("06/06/2022")],
            )
          ],
        ),
      ),
    );
  }
}

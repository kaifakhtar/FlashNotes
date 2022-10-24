import 'package:flutter/material.dart';

import '../modals/note.dart';

class CardDesign extends StatelessWidget {
  Note note;
 Function _deleteNote;
  CardDesign(this.note,this._deleteNote);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 50,
      child: Card(
        color: Colors.pink[50],
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(note.title),
                IconButton(
                    onPressed: ()=>_deleteNote(note.id)
                    ,
                    icon: Icon(Icons.delete))
              ],
            ),
            Text(note.description ?? "No description"),
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

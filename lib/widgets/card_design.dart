import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modals/note.dart';

class CardDesign extends StatelessWidget {
  Note note;
  Function _deleteNote;

  CardDesign(this.note, this._deleteNote);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      height: 100,
      width: 50,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
        color: Colors.pink[50],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(note.title,
              style: GoogleFonts.breeSerif(fontSize: 25),),
              IconButton(
                  onPressed: () => _deleteNote(note.id),
                  icon: Icon(Icons.delete))
            ],
          ),
        ),
      ),
    );
  }
}

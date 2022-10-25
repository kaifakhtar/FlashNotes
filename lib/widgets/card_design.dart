
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../modals/note.dart';


class CardDesign extends StatelessWidget {
  Note note;
  Function _deleteNote;

  CardDesign(this.note, this._deleteNote);
 List<Color> colorList=[Color(0xFFD3CA00),Color(0xFFF69700)];

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        height: 100,
        width: 50,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          color: Colors.yellow[100],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                      note.title,
                      style: GoogleFonts.merriweather(fontSize: 25),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                IconButton(
                    onPressed: () => _deleteNote(note.id),
                    icon: Icon(Icons.delete))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

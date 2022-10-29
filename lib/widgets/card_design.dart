
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../modals/note.dart';


class CardDesign extends StatelessWidget {
  Note note;
  Function _deleteNote;

   Color cardColor;

  CardDesign(this.note, this._deleteNote, this.cardColor);
 //List<Color> colorList=[const Color(0xFFD3CA00),const Color(0xFFF69700)];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height:  (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)*0.7,
      width: double.infinity,
      child: InkWell(
        onTap: (){},
        child: Card(
          elevation: 0,
          margin: const EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          color: Color(0xFF94c2ff),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Text(
                      note.title,
                      style: GoogleFonts.roboto(fontSize: 18),
                      overflow: TextOverflow.fade,
                      softWrap: true,
                      maxLines: 2,
                    ),
                  ),
                IconButton(
                    onPressed: () => _deleteNote(note.id),
                    icon: const Icon(Icons.delete))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

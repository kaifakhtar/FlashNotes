import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../modals/note.dart';
import '../screens/edit_note_screen.dart';


class CardDesign extends StatelessWidget {
  Note note;
  Function _deleteNote;

  Color cardColor;

  CardDesign(this.note, this._deleteNote, this.cardColor);

  //List<Color> colorList=[const Color(0xFFD3CA00),const Color(0xFFF69700)];

  @override
  Widget build(BuildContext context) {
    var screenHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: screenHeight * 0.65,

      width: double.infinity,
      child: InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EditNoteScreen()));
          //move to edit screen
        },
        child: Card(
          elevation: 0,
          margin:  EdgeInsets.only(bottom: screenHeight*0.009),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenHeight*0.035)),
          color: cardColor,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenHeight * 0.03, vertical: screenHeight * 0.04),
            child: Stack(
             // alignment: Alignment.center,
                children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title.isEmpty ? "No title" : note.title,
                    style: GoogleFonts.montserrat(
                        fontSize: screenHeight * 0.046,
                        fontWeight: FontWeight.w400),
                    overflow: TextOverflow.fade,
                    softWrap: true,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: screenHeight*0.03,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFFD6EBF9),
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenHeight * 0.015,
                          vertical: screenHeight * 0.002),
                      child: Text(
                        note.date,
                        style: GoogleFonts.sourceSansPro(
                            fontSize: screenHeight * 0.023),
                      ),
                    ),
                  ),
                  Divider(
                    height: screenHeight * 0.06,
                    thickness: screenHeight * 0.001,
                    color: Colors.grey[700],
                  ),
                   Text("Priority ${note.priority}"),
                  Divider(
                    height: screenHeight * 0.06,
                    thickness: screenHeight * 0.001,
                    color: Colors.grey[700],

                  ),
                  Text(note.description!.isEmpty?"No description":note.description!,
                    maxLines:9,
                  overflow: TextOverflow.fade,
                  softWrap: true,

                  style: GoogleFonts.ptSans(fontSize:screenHeight*0.027,height: screenHeight*0.0014 ,
                  color: Colors.grey.shade800),),
                ],
              ),
              Positioned(
                top: screenHeight * 0.48,
                //left: screenHeight * 0.05,
                //left: 0,
                right: 0,
                child: Row(
                  children: [
                    CircleAvatar(
                      child: const Icon(Icons.share),
                      radius: screenHeight *0.03,
                      backgroundColor: const Color(0xD9D6EBF9),
                    ),
                    SizedBox(
                      width: screenHeight * 0.02,
                    ),
                    CircleAvatar(
                      child: const Icon(Icons.favorite_border),
                      radius: screenHeight *0.03,
                      backgroundColor: const Color(0xD9D6EBF9),
                    ),
                    SizedBox(
                      width: screenHeight * 0.02,
                    ),
                    GestureDetector(
                      onTap: ()=>_deleteNote(note.id),
                      child: CircleAvatar(
                        child: const Icon(Icons.delete_outline_rounded),
                        radius: screenHeight *0.03,
                        backgroundColor: const Color(0xD9D6EBF9),
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }
}

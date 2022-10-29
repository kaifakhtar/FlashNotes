import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChipsPriority extends StatelessWidget {
  const ChipsPriority({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return Row(
      children: [
        Container(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: screenHeight*0.01, horizontal: screenHeight*0.03),
            child: Text("Important",style: GoogleFonts.montserrat(color: Colors.grey[100]),),
          ),
          decoration: BoxDecoration(
              color: Colors.pink,
            borderRadius: BorderRadius.circular(screenHeight*0.06)
          ),

        )
      ],
    );
  }
}

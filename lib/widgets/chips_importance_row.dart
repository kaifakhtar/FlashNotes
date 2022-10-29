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
            padding:  EdgeInsets.symmetric(vertical: screenHeight*0.01, horizontal: screenHeight*0.02),
            child: Text("Important",style: GoogleFonts.montserrat(color: Colors.black),),
          ),
          decoration: BoxDecoration(
            border: Border.all(),
            //  color: Colors.pink,
            borderRadius: BorderRadius.circular(screenHeight*0.06)
          ),

        ),
        Container(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: screenHeight*0.01, horizontal: screenHeight*0.03),
            child: Text("Important",style: GoogleFonts.montserrat(color: Colors.black),),
          ),
          decoration: BoxDecoration(
              border: Border.all(),

              borderRadius: BorderRadius.circular(screenHeight*0.06)
          ),

        ),
        Container(
          child: Padding(
            padding:  EdgeInsets.symmetric(vertical: screenHeight*0.01, horizontal: screenHeight*0.03),
            child: Text("Important",style: GoogleFonts.montserrat(color: Colors.black),),
          ),
          decoration: BoxDecoration(
              border: Border.all(),

              borderRadius: BorderRadius.circular(screenHeight*0.06)
          ),

        )
      ],
    );
  }
}

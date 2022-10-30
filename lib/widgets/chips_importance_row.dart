import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChipsPriority extends StatefulWidget {
  @override
  State<ChipsPriority> createState() => _ChipsPriorityState();
}

class _ChipsPriorityState extends State<ChipsPriority> {
  bool chip1col = false;

  @override
  Widget build(BuildContext context) {
    var screenHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            chip1col = !chip1col;
            setState((){});
          },
          child: Container(
            alignment: Alignment.center,
            width: screenHeight * 0.14,
            decoration: BoxDecoration(
                color: chip1col ? Colors.red : Color(0x00FFFFFF),
                border: Border.all(),
                //  color: Colors.pink,
                borderRadius: BorderRadius.circular(screenHeight * 0.06)),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: screenHeight * 0.01,
                  horizontal: screenHeight * 0.01),
              child: Text(
                "Important",
                style: GoogleFonts.montserrat(color: Colors.black),
              ),
            ),
          ),
        ),
        SizedBox(
          width: screenHeight * 0.023,
        ),
        Container(
          alignment: Alignment.center,
          width: screenHeight * 0.14,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01, horizontal: screenHeight * 0.01),
            child: Text(
              "Moderate",
              style: GoogleFonts.montserrat(color: Colors.black),
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(screenHeight * 0.06)),
        ),
        SizedBox(
          width: screenHeight * 0.023,
        ),
        Container(
          alignment: Alignment.center,
          width: screenHeight * 0.14,
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.01, horizontal: screenHeight * 0.01),
            child: Text(
              "Least",
              style: GoogleFonts.montserrat(color: Colors.black),
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(screenHeight * 0.06)),
        )
      ],
    );
  }
}

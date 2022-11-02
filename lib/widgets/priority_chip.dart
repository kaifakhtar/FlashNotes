import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriorityChip extends StatelessWidget {


  int selectedPriority;
  String ChipText;
  Color chipColor;
  PriorityChip({required this.selectedPriority,required this.ChipText, required this.chipColor});

  @override
  Widget build(BuildContext context) {
    var screenHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top);
    return Container(
      alignment: Alignment.center,
      width: screenHeight * 0.14,
      decoration: BoxDecoration(
          color: chipColor,
          border: Border.all(width: 2),
          //  color: Colors.pink,
          borderRadius: BorderRadius.circular(screenHeight * 0.06)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.01,
            horizontal: screenHeight * 0.01),
        child: Text(
          ChipText,
          style: GoogleFonts.montserrat(color: Colors.black),
        ),
      ),
    );
  }


}

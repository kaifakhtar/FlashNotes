import 'package:flutter/material.dart';

class CardDesign extends StatelessWidget {
  const CardDesign({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 50,
      child: Card(
        color: Colors.pinkAccent[50],
        child: Column(
          children: [
            Text("Title here"),
            Text(("Notes here")),
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

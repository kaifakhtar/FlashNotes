import 'package:flutter/material.dart';

class NoNoteBanner extends StatelessWidget {
  const NoNoteBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 100),
      height: 100,
      child: Text(
        "Please Add Note",
        style: TextStyle(
          fontSize: 20
        ),
      ),
    );
  }
}

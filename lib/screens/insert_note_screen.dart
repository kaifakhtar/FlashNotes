import 'package:flutter/material.dart';

class InsertNoteScreen extends StatelessWidget {
  const InsertNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.pinkAccent[500],
        centerTitle: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            "Add Your Note ",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.note_add))
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                icon: CircleAvatar(child: Icon(Icons.add),
                backgroundColor: Colors.pink[100],),
                hintText: "Title",
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: Text("Done")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
// TODO to add 2 text input fields

import 'package:flutter/material.dart';

class InsertNoteScreen extends StatelessWidget {
  const InsertNoteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.pinkAccent[500],
        //centerTitle: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          const Text(
            "Add Your Note ",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.done_all_sharp))
        ]),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.pink[50],
                  hintText: "Title",
                ),
              ),
              SizedBox(height: 50),
              TextField(
                maxLines: 25,
                decoration: InputDecoration(
                  hintText: "Enter your note",
                  fillColor: Colors.pink[50],
                  filled: true,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton:
          FloatingActionButton.extended(onPressed: () {}, label: Text("Done")),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
// TODO to add 2 text input fields

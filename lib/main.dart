import 'package:flutter/material.dart';
import 'database_helper.dart';
void main() {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {


  var dbhelper=DatabaseHelper.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _insert,
          child: Text("Insert"),
        ),
      ),
    );
  }
  void _insert() async {
    Map<String,dynamic> row ={
      DatabaseHelper.columnName:"Kaif Bro"
    };
    int? i = await dbhelper.insert(row);
    print("insert return is ${i}");
  }
}

import 'package:flutter/material.dart';

import '../database_helper.dart';

class QueryScreen extends StatefulWidget {

  @override
  State<QueryScreen> createState() => _MyAppState();
}

class _MyAppState extends State<QueryScreen> {
  int id=1;

  var dbhelper=DatabaseHelper.instance;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: _insert,
              child: Text("Insert"),
            ),
            ElevatedButton(
              onPressed: _update,
              child: Text("Update"),
            ),
            ElevatedButton(
              onPressed:()=> _delete(id),
              child: Text("delete"),
            ),
            ElevatedButton(
              onPressed: _queryAll,
              child: Text("Query"),
            ),
          ],
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

  void _update() async{
    Map<String,dynamic> updatedRow ={
      DatabaseHelper.columnId:1,
      DatabaseHelper.columnName:"shah bro"
    };
    await dbhelper.update(updatedRow);
  }

  void _queryAll() async {
    List<Map<String, dynamic>>? querylist =await dbhelper.queryAll();
    print(querylist);
  }

  void _delete(int id) async {
    await dbhelper.delete(id);
    id++;
  }
}

import 'package:flutter/material.dart';

import '../database_helper.dart';


class QueryMiddle {

  var dbhelper=DatabaseHelper.instance;

  void insert(Map<String,dynamic> row) async {
    // Map<String,dynamic> row ={
    //   DatabaseHelper.columnTitle:"Kaif Bro"
    // };
    int? i = await dbhelper.insert(row);
    print("insert return is ${i}");
  }

  // void _update() async{
  //   Map<String,dynamic> updatedRow ={
  //     DatabaseHelper.columnId:1,
  //     DatabaseHelper.columnName:"shah bro"
  //   };
  //   await dbhelper.update(updatedRow);
  // }
  //
  Future<List<Map<String, dynamic>>?> queryAll() async {
    List<Map<String, dynamic>>? querylist =await dbhelper.queryAll();
    //print(querylist);
    return querylist;

  }

  void delete(int id) async {
    await dbhelper.delete(id);
    print("Successfully deleted");
  }
}

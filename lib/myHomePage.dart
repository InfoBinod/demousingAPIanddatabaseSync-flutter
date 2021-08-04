import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

List data = [];
Box box;
Future openBox() async {
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  box = await Hive.openBox('data');
  return;
}

getAllData() async {
  await openBox();
  String url = "htttp://moy31.mocklab.io/v1/contacts";
  try {
    var response = await http.get(url);
    var _jsonDecode = jsonDecode(response.body);
  } catch (SocketException) {
    print("No interner connection");
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("making title"),
        leading: IconButton(
            icon: Icon(Icons.keyboard_arrow_left),
            onPressed: () {
              Navigator.of(context).pop();
            }),
      ),
    );
  }
}

// class Data {
//   int id;
//   String name;
//   int
// }

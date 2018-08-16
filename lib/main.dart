
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}


class HomePageState extends State<HomePage> {

  Future<String> getdata() async {
    http.Response  response = await http.get(
      Uri.encodeFull("http://localhost:5000/user"),
      headers: {
        "Accept": "aplication/json"
        }
    );

    
    List data = JSON.decode(response.body);
    print(data);

  }
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        body: new Center(
          child: new RaisedButton(
            child: new Text("Get Data"),
            onPressed: getdata,
          ),
        ),
      );
    }
}
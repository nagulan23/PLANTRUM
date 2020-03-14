import 'dart:async';
import 'dart:convert';
import 'package:first_project/Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_networkimage/flutter_advanced_networkimage.dart';
import 'package:http/http.dart' as http;

class WeatherDetail extends StatefulWidget {
  final String nam;
  @override
  WeatherDetail({Key key,@required this.nam}): super(key: key);
  _MyHomePageState createState() => new _MyHomePageState(name: this.nam);
  
}

class _MyHomePageState extends State<WeatherDetail> {
  final String name;
  _MyHomePageState({this.name});
  
  String url =
      'https://nagulan23.github.io/plant-database/db.json';
  List data;
  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(name));

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata["DailyForecasts"];
    });
  }

  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    print(name);
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Weather Detail"),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, i) {
          return new Container(
            child: Row(
              children: <Widget>[
                Image(
                    image: AdvancedNetworkImage(data[i]["Day"]["Icon"],useDiskCache: true),
                    fit: BoxFit.cover,
                    )
              ],
            ),
          );
        },
      ),
    );
  }
}

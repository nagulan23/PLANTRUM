import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  // Declare a field that holds the Todo.
  final String soil,water,sun,sunl;
  final String care;
  final String name,seed,seedl,cut,crom,crown,inw,bulb;
  // In the constructor, require a Todo.
  Details({Key key,@required this.seed,@required this.seedl,@required this.cut,@required this.bulb,@required this.inw,@required this.crom,@required this.crown, @required this.soil, @required this.water, @required this.sun,@required this.sunl,@required this.care, @required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the Todo to create the UI.
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      
      body: ListView(
        children: <Widget>[
          Image.network("https://www.almanac.com/sites/default/files/styles/primary_image_in_article/public/image_nodes/shasta-daisies-plant-grow.jpg?itok=cOUd7rGn",fit:BoxFit.fill,height: 200,),
            (soil!="")?Text("Soil:",textScaleFactor: 2.5,style: TextStyle(fontWeight: FontWeight.bold)):Text(""),
            (soil!="")?Text("    "+soil,textScaleFactor: 1.1,style: TextStyle(color: Colors.black87)):Text(""),
            (water!="")?Text("Water:",textScaleFactor: 2.5,style: TextStyle(fontWeight: FontWeight.bold)):Text(""),
            (water!="")?Text("    "+water,textScaleFactor: 1.1,style: TextStyle(color: Colors.black87)):Text(""),
            (sun!="")?Text("Sunlight:",textScaleFactor: 2.5,style: TextStyle(fontWeight: FontWeight.bold)):Text(""),
            (sun!="")?Text("    "+sun,textScaleFactor: 1.1,style: TextStyle(color: Colors.black87)):Text(""),
            (sunl!="")?GestureDetector(
              child: Text("Click here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
              onTap: () {
                launch(sunl);
              }
            ):Text(""),
            Text("Ways to grow:",textScaleFactor: 2.5,style: TextStyle(fontWeight: FontWeight.bold)),
            Row (
              children: <Widget>[
                Text("  ⦿  by seeds: ",textScaleFactor: 1.1,style: TextStyle(color: Colors.black87)),
                (seed!="")?GestureDetector(
                      child: Text("Click here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                      onTap: () {
                        launch(seed);
                       }
                ):Text("---"),
              ]
            ),
            Row (
              children: <Widget>[
                Text("  ⦿  by seedlings: ",textScaleFactor: 1.1,style: TextStyle(color: Colors.black87)),
                (seedl!="")?GestureDetector(
                      child: Text("Click here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                      onTap: () {
                        launch(seedl);
                       }
                ):Text("---"),
              ]
            ),
            Row (
              children: <Widget>[
                Text("  ⦿  by cutings: ",textScaleFactor: 1.1,style: TextStyle(color: Colors.black87)),
                (cut!="")?GestureDetector(
                      child: Text("Click here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                      onTap: () {
                        launch(cut);
                       }
                ):Text("---"),
              ]
            ),
            Row (
              children: <Widget>[
                Text("  ⦿  by bulb: ",textScaleFactor: 1.1,style: TextStyle(color: Colors.black87)),
                (bulb!="")?GestureDetector(
                      child: Text("Click here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                      onTap: () {
                        launch(bulb);
                       }
                ):Text("---"),
              ]
            ),
            Row (
              children: <Widget>[
                Text("  ⦿  in-water: ",textScaleFactor: 1.1,style: TextStyle(color: Colors.black87)),
                (inw!="")?GestureDetector(
                      child: Text("Click here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                      onTap: () {
                        launch(inw);
                       }
                ):Text("---"),
              ]
            ),
            Row (
              children: <Widget>[
                Text("  ⦿  by crom: ",textScaleFactor: 1.1,style: TextStyle(color: Colors.black87)),
                (crom!="")?GestureDetector(
                      child: Text("Click here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                      onTap: () {
                        launch(crom);
                       }
                ):Text("---"),
              ]
            ),
            Row (
              children: <Widget>[
                Text("  ⦿  by crown: ",textScaleFactor: 1.1,style: TextStyle(color: Colors.black87)),
                (crown!="")?GestureDetector(
                      child: Text("Click here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                      onTap: () {
                        launch(crown);
                       }
                ):Text("---"),
              ]
            ),
            Row (
              children: <Widget>[
                (care!="")?Text("How to take Care: ",textScaleFactor: 2.5,style: TextStyle(fontWeight: FontWeight.bold)):Text(""),
                (care!="")?GestureDetector(
                      child: Text("Click here", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
                      onTap: () {
                        launch(care);
                       }
                ):Text(""),
              ]
            ),
            Text("")
        ]
      ),
    );
  }
}
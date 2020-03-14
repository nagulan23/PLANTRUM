import 'dart:async';
import 'dart:convert';
import 'package:first_project/Details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;

class Listc extends StatefulWidget {
  final String nam;
  @override
  Listc({Key key,@required this.nam}): super(key: key);
  _MyHomePageState createState() => new _MyHomePageState(name: this.nam);
  
}

class _MyHomePageState extends State<Listc> {
  String name,nam="";
  
  
  _MyHomePageState({this.name});
  
  String url =
      'https://nagulan23.github.io/plant-database/db.json';
  List data;
  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(url));
    print("ls");
    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata[name]["det"];
      nam= extractdata[name]["name"];
    });
  }
  void getData() async{
    final databaseReference =await FirebaseDatabase.instance.reference();
    databaseReference.once().then((DataSnapshot snapshot) {
      setState(() {
      data = snapshot.value[name]["det"];
      nam= snapshot.value[name]["name"];
    });
    });
  }
  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print(name);
    return new Scaffold(
      appBar: new AppBar(
        title:(nam=="")? CircularProgressIndicator(backgroundColor: Colors.white,): Text(nam),
      ),
      body: new ListView.separated(
        itemCount: data == null ?0: data.length,
        itemBuilder: (BuildContext context, i) {
          return new ListTile(
              leading: new CircleAvatar(
                backgroundImage: NetworkImage(data[i]["img1"]),
              ),
              title: new Text(data[i]["name"]),
              trailing: Icon(
                Icons.arrow_forward_ios,
              ),
              onTap: () {
                Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (ctxt) => new Details(seed:data[i]["seed"],seedl:data[i]["seedlings"],cut:data[i]["cuttings"],bulb:data[i]["bulb"],inw:data[i]["inwater"],crom:data[i]["crom"],crown:data[i]["crown"],soil:data[i]["soil"],water:data[i]["water"],sun:data[i]["sunlight"],sunl:data[i]["sunlink"],care:data[i]["caring"],name:data[i]["name"])),
                          );
              });
        },
        separatorBuilder: (context, index) {
          return Divider();
        },
      ),
    );
  }
}

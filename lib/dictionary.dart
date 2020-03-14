import 'package:first_project/listcreation.dart';
import 'package:first_project/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async';

class Dictionary extends StatelessWidget {
  //.................................Dictionary


  
  @override
  Widget build(BuildContext context) {
    print('dzx');
    debugShowCheckedModeBanner: false;
    const green = const Color(0xff00cf00);
    return Scaffold(
        backgroundColor: Colors.lightGreenAccent,
        appBar: AppBar(
          title: Text('Plantopedia'),
          backgroundColor: green,
        ),
        body: Card(
            elevation: 0,
            color: Colors.lightGreenAccent,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  color: Colors.lightGreenAccent,
                  padding: EdgeInsets.all(20),
                  child: new SizedBox(
                    height: 100,
                    child: RaisedButton(
                      elevation: 0,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/medicinal.jpg',
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          Text("  Medicinal Plants",
                              style: TextStyle(fontSize: 20)),
                          Icon(Icons.arrow_right, size: 60, )
                        ],
                      ),
                      highlightColor: green,
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (ctxt) => new Listc(nam:"medicinal_Plants")),
                          );
                      },
                    ),
                  ),
                ),
                Container(
                  color: Colors.lightGreenAccent,
                  padding: EdgeInsets.all(20),
                  child: new SizedBox(
                    height: 100,
                    child: RaisedButton(
                      elevation: 0,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/flower.jpg',
                            height: 50,
                            fit: BoxFit.fitHeight,
                          ),
                          Text("  Flowering Plants",
                              style: TextStyle(fontSize: 20)),
                          Icon(Icons.arrow_right, size: 60)
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (ctxt) => new Listc(nam:"flowering_Plants")),
                          );
                      },
                    ),
                  ),
                ),
                Container(
                  color: Colors.lightGreenAccent,
                  padding: EdgeInsets.all(20),
                  child: new SizedBox(
                    height: 100,
                    child: RaisedButton(
                      elevation: 0,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/aromatic.jpg',
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          Text("  Aromatic Plants",
                              style: TextStyle(fontSize: 20)),
                          Icon(Icons.arrow_right, size: 60)
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (ctxt) => new Listc(nam:"aromatic")),
                          );
                      },
                    ),
                  ),
                ),
                Container(

                  color: Colors.lightGreenAccent,
                  padding: EdgeInsets.all(20),
                  child: new SizedBox(
                    height: 100,
                    child: RaisedButton(
                      elevation: 0,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/fruits.jpg',
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          Text("  Fruit crops        ",
                              style: TextStyle(fontSize: 20)),
                          Icon(Icons.arrow_right, size: 60,)
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (ctxt) => new Listc(nam:"fruits")),
                          );
                      },
                    ),
                  ),
                ),
                Container(
                  color: Colors.lightGreenAccent,
                  padding: EdgeInsets.all(20),
                  child: new SizedBox(
                    height: 100,
                    child: RaisedButton(
                      elevation: 0,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          Image.asset(
                            'assets/vegetables.jpg',
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          Text("  Vegetable crops",
                              style: TextStyle(fontSize: 20)),
                          Icon(Icons.arrow_right, size: 60)
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (ctxt) => new Listc(nam:"vegetables")),
                          );
                      },
                    ),
                  ),
                ),
              ],
            )));
  }
}

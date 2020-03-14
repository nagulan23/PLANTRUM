import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Popup extends StatefulWidget {
  final List data;
  @override
  Popup({Key key, @required this.data}) : super(key: key);
  _PopupState createState() => _PopupState(data: this.data);
}

class _PopupState extends State<Popup> {
  final List data;
  _PopupState({this.data});
  @override
  Widget build(BuildContext context) {
    print("popuped");
    return Dialog(

      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        alignment: Alignment.topLeft,
        children: <Widget>[
        
        Container(
          //alignment: Alignment(-1,-1),
          padding: EdgeInsets.only(
            top: 20,
            bottom: 0,
            left: 10,
            right: 10,
          ),
          margin: EdgeInsets.only(top: 20),
          //margin: EdgeInsets.all(0),
          decoration: new BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                offset: const Offset(0.0, 10.0),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // To make the card compact
            children: <Widget>[
              Text(
                "NOTIFICATION",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                "none",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 24.0),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // To close the dialog
                  },
                  child: Text("ok"),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 10,
          right: 10,
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 20,
          ),
        ),
      ]),
    );
  }
}

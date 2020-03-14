import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'global.dart' as global;

class Accweather extends StatefulWidget {
  @override
  _AccweatherState createState() => _AccweatherState();
}

class _AccweatherState extends State<Accweather> {
  Completer<WebViewController> _controller = Completer<WebViewController>();
  String url = "", url1 = "";
  Position position, p1;
  //var location = new Location();
  //var currentLocation = LocationData;
  //Map<String, double> userLocation;
  String link = "", key = "", place = "";
  List data;
  var addresses;
  int temp, flag = 0;

  @override
  void initState() {
    //makeRequest();]
    print("intstate");
  }

  @override
  Widget build(BuildContext context) {
    data=global.data;
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Forecast of "+global.city.toString(),style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17)),
      ),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, i) {
          return new Card(
            elevation: 20,
            margin: EdgeInsets.all(15),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(place),
                  //Image.network("https://developer.accuweather.com/sites/default/files/" + data[i]["Day"]["Icon"].toString() + "-s.png"),

                  Text(
                      data[i]["Temperature"]["Minimum"]["Value"].toString() +
                          "°C - " +
                          data[i]["Temperature"]["Maximum"]["Value"]
                              .toString() +
                          "°C",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20)),
                  //Text("DAY",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(" "),
                  //Align(
                  //alignment:Alignment.center,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.brightness_5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          (data[i]["Day"]["Icon"] < 10)
                              ? Image.network(
                                  "https://developer.accuweather.com/sites/default/files/0" +
                                      data[i]["Day"]["Icon"].toString() +
                                      "-s.png")
                              : Image.network(
                                  "https://developer.accuweather.com/sites/default/files/" +
                                      data[i]["Day"]["Icon"].toString() +
                                      "-s.png"),
                          Text(data[i]["Day"]["IconPhrase"],style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10)),
                        ],
                      ),
                      new RotatedBox(
                        quarterTurns: 1,
                        child: Icon(
                          Icons.remove,
                          size: 70,
                          color: Colors.black12,
                        ),
                      ),
                      Icon(Icons.brightness_2),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            (data[i]["Night"]["Icon"] < 10)
                                ? Image.network(
                                    "https://developer.accuweather.com/sites/default/files/0" +
                                        data[i]["Night"]["Icon"].toString() +
                                        "-s.png")
                                : Image.network(
                                    "https://developer.accuweather.com/sites/default/files/" +
                                        data[i]["Night"]["Icon"].toString() +
                                        "-s.png"),
                            Text(data[i]["Night"]["IconPhrase"],style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 10))
                          ]),
                    ],
                  ),
                  //),

                  Container(
                    child: Text(
                      data[i]["Date"].substring(0, 10),
                      textAlign: TextAlign.center,
                    ),
                    alignment: Alignment.centerLeft,
                  ),
                ],
              ),
            ),
          );
        },
      ),
      /*body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: <Widget>[
            link == ""
                ? CircularProgressIndicator()
                : launch("https://m.accuweather.com/en/in/boluvampatti/2808667/extended-weather-forecast/2808667?lang=en-us",
                              forceWebView: true),
            
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  _getLocation().then((value) {
                    setState(() async{
                      userLocation =await value;
                      url = "https://weather.cit.api.here.com/weather/1.0/report.json?product=observation&latitude=" +
                          userLocation["latitude"].toString() +
                          "&longitude=" +
                          userLocation["longitude"].toString() +
                          "&oneobservation=true&app_id=DemoAppId01082013GAL&app_code=AJKnXv84fjrb0KIHawS0Tg";
                      
                      this.makeRequest();
                    });
                  });
                },
                color: Colors.blue,
                child: Text(
                  "Get Location",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),*/
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
//import 'package:location/location.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:url_launcher/url_launcher.dart';

class GetLocationPage extends StatefulWidget {
  @override
  _GetLocationPageState createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {
  String url = "";
  Position position, p1;
  //var location = new Location();
  //var currentLocation = LocationData;
  //Map<String, double> userLocation;
  String place, sky, icon;
  var addresses;
  int temp;
  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(url));
    if (this.mounted) {
      setState(() {
        var extractdata = json.decode(response.body);
        place = extractdata["name"];
        sky = extractdata["weather"][0]["description"];
        icon = extractdata["weather"][0]["icon"];
        temp = extractdata["main"]["temp"];
      });
    }
  }

  @override
  void initState() {
    //this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    /*_getLocation();
    setState(() async{
                      p1= await position;
                      url = "https://openweathermap.org/data/2.5/weather?lat=" +
                          position.latitude.toString() +
                          "&longitude=" +
                          position.longitude.toString() +
                          "&lon=76.8957587&appid=b6907d289e10d714a6e88b30761fae22";
                      
                      this.makeRequest();
                    });*/

    _getLocation().then((value) {
      setState(() async {
        p1 = await value;
        addresses = await Geocoder.local.findAddressesFromCoordinates(Coordinates(p1.latitude,p1.longitude));

        url = "https://openweathermap.org/data/2.5/weather?lat=" +
            p1.latitude.toString() +
            "&longitude=" +
            p1.longitude.toString() +
            "&lon=76.8957587&appid=b6907d289e10d714a6e88b30761fae22";

        this.makeRequest();
      });
    });
    /*
    try {
  currentLocation = await location.getLocation();
} on PlatformException catch (e) {
  if (e.code == 'PERMISSION_DENIED') {
    print('Permission denied');
  } 
  currentLocation = null;
}*/
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            url == ""
                ? CircularProgressIndicator()
                : Text(
                    temp.toString() + "°C",
                    textScaleFactor: 3,
                    style: TextStyle(color: Colors.red),
                  ),
            url == ""
                ? Text("")
                : Text(
                    "weather:" + sky,
                    textScaleFactor: 2,
                  ),
            url == ""
                ? Text("")
                : Text(addresses.first.addressLine),
            
            url == ""
                ? Text("")
                : Image.network(
                    "http://openweathermap.org/img/wn/" + icon + "@2x.png"),
            
            /* Padding(
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
            ),*/
          ],
        ),
      ),
    );
  }

  Future _getLocation() async {
    /*var currentLocation = LocationData;
    //var currentLocation=LocationData;
    try {
  currentLocation = await location.getLocation();
} on PlatformException catch (e) {
  if (e.code == 'PERMISSION_DENIED') {
    error = 'Permission denied';
  } 
  currentLocation = null;
}
    return currentLocation;*/
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
    print(position.latitude);
  }
}

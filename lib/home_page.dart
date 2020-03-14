import 'package:first_project/Webweather.dart';
import 'package:first_project/accweather.dart';
import 'package:first_project/chatbot.dart';
import 'package:first_project/dictionary.dart';
import 'package:first_project/popup.dart';
import 'package:first_project/weather.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'dart:convert';
import 'global.dart' as global;
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:path/path.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth.dart';
import 'main.dart';
import 'root_page.dart';
import 'todo.dart';

// delete this MaterialApp(ChangeNotifierProvider<AuthService>(child: MyApp(),builder: (BuildContext context) {  return AuthService();  },),
/*
void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner:false,home: MyApp()));
}*/
class MyApp extends StatefulWidget {
  MyApp({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);
  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;
  @override
  _MyAppState createState() => new _MyAppState();
}

/*class Dict extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Dictionary();
  }
}*/

class _MyAppState extends State<MyApp> {
  //..........................................MyApp
  double pressed = 50;
  final controller = ScrollController();
  String url = "", url1 = "";
  Position position, p1;
  String link = "", key = "", place = "";
  var addresses;
  List data, note;
  int temp, flag = 0;
/*
  @override
  void initState() {
    //WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
    controller.addListener(onScroll);
  }
  _getPositions() {
    final RenderBox renderBoxRed = _keyRed.currentContext.findRenderObject();
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
    pressed: positionRed;
  }
  onScroll() {
    setState(() {
      _getPositions();
      //cWidth = controller.offset * screenWidth / (itemHeight * itemsCount);
      //pressed=60-(controller.offset*0.25);
      //if(pressed<0)
      //pressed=00;
    });
  }*/

  Future makeRequest() async {
    global.f2=1;
    print("123");
    var response = await http.get((url));
    if ((this.mounted) && (data == null)) {
      setState(() {
        var extractdata = json.decode(response.body);
        global.data = extractdata["DailyForecasts"];
        print(":(");
      });
    }
  }

  Future makeRequest2() async {
    global.f1=1;
    print("ddddd");
    var response = await http.get(url1);
    if ((this.mounted) && (key == "")) {
      setState(() {
        var extractdata =  json.decode(response.body);
        global.city= extractdata["LocalizedName"];
        key = extractdata["Key"];
        print(key);
        print("reach");
      });
    }
  }

  Future _getLocation() async {
    position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    return position;
  }
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }


  @override
  Widget build(BuildContext context) {
    const green = const Color(0xff00cf00);
    //SystemChrome.setEnabledSystemUIOverlays([]);
    print(global.f1);
    _getLocation().then((value) async {
      p1 = await value;
      //addresses = await Geocoder.local.findAddressesFromCoordinates(Coordinates(p1.latitude,p1.longitude));

      p1!=null?url1 =
          "http://dataservice.accuweather.com/locations/v1/cities/geoposition/search?apikey=%208GkGVA1CxXyYla0tj6DNjb8t4zmEucDs&q=" +
              p1.latitude.toString() +
              "%2C" +
              p1.longitude.toString() +
              "&language=en&details=false&toplevel=false":print("wait");

      print("url1=" + url1);
      (url1!="")&&global.f1==0?this.makeRequest2():print("waiting1");

      global.f1==1&&key!=""&&global.f2==0?url = "http://dataservice.accuweather.com/forecasts/v1/daily/5day/" +key +"?apikey=8GkGVA1CxXyYla0tj6DNjb8t4zmEucDs&language=en&details=true&metric=true":print("last waiting");
      //url="https://raw.githubusercontent.com/nagulan23/plant-database/master/weather.json";
      print(url);
      global.f1==1&&url!=""&&global.f2==0?this.makeRequest():print("waiting");

    });

    print("finish");
    return MaterialApp(
      home:Scaffold(
        
      backgroundColor: Colors.limeAccent,
      
      appBar: AppBar(
        title: Text('PlantApp'),
        backgroundColor: green,
        ),
        /*bottomNavigationBar: FancyBottomNavigation(
    tabs: [
        TabData(iconData: Icons.home, title: "Home"),
        TabData(iconData: Icons.search, title: "Search"),
        TabData(iconData: Icons.shopping_cart, title: "Basket")
    ],
    onTabChangedListener: (position) {
        setState(() {
        });
    },
),*/
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,

          children: <Widget>[
            new UserAccountsDrawerHeader(
              accountName: new Text("Nagulan S"),
              accountEmail: new Text("nagulan1645@gmail.com"),
              currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://drive.google.com/uc?export=view&id=1XPisbt0dfBi535OI2D4JsoWeJebKMs2s")),
            ),
            new ListTile(
                leading: Icon(Icons.person),
                title: new Text("Profile"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.movie),
                title: new Text("Movies"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.shopping_cart),
                title: new Text("Shopping"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.apps),
                title: new Text("Apps"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.dashboard),
                title: new Text("Docs"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.settings),
                title: new Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new Divider(),
            new ListTile(
                leading: Icon(Icons.info),
                title: new Text("About"),
                onTap: () {
                  Navigator.pop(context);
                }),
            new ListTile(
                leading: Icon(Icons.power_settings_new),
                title: new Text("Logout"),
                onTap: () {
                  signOut();
                }),
          ],
        ),
      ),
      body: Stack(
        //controller: controller,
        children: <Widget>[
          Container(
            child: IconButton(
              //child: Text("sdadsas"),
              icon: Icon(Icons.insert_emoticon, color: Colors.amber),
              iconSize: 70,
              onPressed: () {
                print('sdfds');
                //notify();
                /*Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (ctxt) => new Popup(data: note)),
                          );*/
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Popup(
                    data: note,
                  ),
                );
                //Popup(data: note);
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: SingleChildScrollView(
              //padding: const EdgeInsets.only(top: 100.0),
              scrollDirection: Axis.horizontal,

                child: Row(
                  children: <Widget>[
                    //Image.asset('assets/plant.jpg'),
                    //pressed % 2 == 0 ? Text("hi") : Text("BYE"),
                    Container(
                      //width: 200,
                      margin: EdgeInsets.all(20.0),
                      child: RaisedButton(
                        shape: new CircleBorder(),
                        elevation: 2,
                        color: Colors.blue,
                        padding: EdgeInsets.all(40),
                        onPressed: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (ctxt) => new HomePageDialogflow()),
                            );
                        },

                        child: Icon(Icons.forum, size: 50),
                        //shape: CircleAvatar(child:green),
                      ),
                    ),
                    AnimatedContainer(
                      duration: Duration(seconds: 1),
                      margin: EdgeInsets.all(20),
                      child: SizedBox(
                        //width: 200,
                        //height: 200,
                        child: RaisedButton(
                          shape: new CircleBorder(),
                          elevation: 2,
                          color: Colors.blue,
                          padding: EdgeInsets.all(40),
                          onPressed: () {
                            print("fsdf");
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (ctxt) => new Dictionary()),
                            );
                            setState(() {});
                            //navigateToSubPage(context);
                            print("asas");
                          },
                          child: AnimatedContainer(
                            duration: Duration(microseconds: 1000),
                            child: Icon(
                              Icons.local_florist,
                              size: pressed,
                            ),
                          ),
                          //shape: CircleAvatar(child:green),
                        ),
                      ),
                    ),
                    Container(
                      //width: 200,
                      margin: EdgeInsets.all(20.0),
                      child: RaisedButton(
                          shape: new CircleBorder(),
                          elevation: 2,
                          color: Colors.blue,
                          padding: EdgeInsets.all(40),
                          
                          onPressed: () {
                            /*launch("https://www.yahoo.com/news/weather/",
                              forceWebView: true);*/
                              if(global.f2==1)
                              {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (ctxt) => new Accweather(
                                      ))
                            
                            );
                              }
                          },
                          child:(global.f2==0)?CircularProgressIndicator(backgroundColor: Colors.black,): Icon(Icons.wb_sunny, size: 50),
                          //child: Text('3', style: TextStyle(fontSize: 20)),
                          //shape: CircleAvatar(child:green),
                          ),
                    ),
                    Container(
                      //width: 200,
                      margin: EdgeInsets.all(20.0),
                      child: RaisedButton(
                          shape: new CircleBorder(),
                          elevation: 2,
                          color: Colors.blue,
                          padding: EdgeInsets.all(40),
                          onPressed: () {},
                          child: Icon(
                            Icons.bug_report,
                            size: 50,
                            color: Colors.black,
                          )
                          //shape: CircleAvatar(child:green),
                          ),
                    ),
                  ],
                ),
            ),
          ),
        ],
      ),
    )
    );
  }
}

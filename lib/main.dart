import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color buttonColor = Color.fromRGBO(48, 56, 76, 1);
  Map<String,String> Urls = {
    "BOL":"http://invoice.rvcctransport.com",
    "Safety":"http://safety.rvcctransport.com",
    "Maintenance":"http://Maintenance.rvcctransport.com",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/Logo.png'),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: buttonColor)),
              child: Text("BOL Upload"),
                onPressed:()=>openLink("BOL"),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: buttonColor)),
              child: Text("Receipt Upload"),
              onPressed:()=>openLink('BOL'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: buttonColor)),
              child: Text("Unit Maintenance Upload"),
              onPressed:()=>openLink('Maintenance'),
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: buttonColor)),
              child: Text("Job Safety Assessment"),
              onPressed:()=>openLink('Job Safety'),
            ),
          ],
        ),
      ),
    );
  }

  openLink(String key)async {
    String url = Urls[key];
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }

  }
}

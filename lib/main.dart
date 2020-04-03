import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SafeArea(child: MyHomePage(title: 'Flutter Demo Home Page')),
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 8,
              color: Color(0xff0B0529),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset("assets/images/poster1.jpg",
                            height: 250),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "Star Citizen",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.white),
                          ),
                          Text(
                            "Star Citizen",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

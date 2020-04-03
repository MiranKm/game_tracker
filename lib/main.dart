import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'constants.dart';

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
          fontFamily: "ReemKufi",
          textTheme: TextTheme()
              .merge(TextTheme(subtitle1: TextStyle(fontFamily: "ReemKufi"))),
          primaryColor: Constants.primaryColor,
          accentColor: Constants.accentColor,
          primarySwatch: Colors.blue,
          canvasColor: Constants.accentColor,
          appBarTheme: AppBarTheme(
            color: Constants.primaryColor,
            textTheme: TextTheme()
                .merge(TextTheme(subtitle1: TextStyle(fontFamily: "ReemKufi"))),
          )),
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
      backgroundColor: Constants.accentColor,
      body: Stack(
        children: <Widget>[
          ListView(
            children: <Widget>[
              SizedBox(height: 125),
              Item(),
              Item(),
              Item(),
              Item(),
            ],
          ),
          Container(
            height: 125,
            decoration: BoxDecoration(
              color: Constants.primaryColor.withAlpha(150),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Game Cracker",
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                  Container(
                    height: kToolbarHeight,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: 200,
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Constants.accentColor),
                          child: DropdownButton<String>(
                            value: "A",
                            underline: SizedBox(),
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_drop_down_circle,
                              color: Colors.white,
                            ),
                            items: <String>['A', 'B', 'C', 'D']
                                .map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  child: new Text(
                                    "Item#$value",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  width: 200.0, //200.0 to 100.0
                                ),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                        Container(
                          width: 200,
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          margin: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(32),
                              color: Constants.accentColor),
                          child: DropdownButton<String>(
                            value: "A",
                            underline: SizedBox(),
                            isExpanded: true,
                            icon: Icon(
                              Icons.arrow_drop_down_circle,
                              color: Colors.white,
                            ),
                            items: <String>['A', 'B', 'C', 'D']
                                .map((String value) {
                              return new DropdownMenuItem<String>(
                                value: value,
                                child: Container(
                                  child: new Text(
                                    "Item#$value",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  width: 200.0, //200.0 to 100.0
                                ),
                              );
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),

        ],
      ),
    );
  }
}

class Item extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: () {
        showModalBottomSheet(
          barrierColor: Colors.white.withAlpha(1),
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext context) {
            return Container(
              height: 300,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(10.0),
                      topRight: const Radius.circular(10.0),
                    ),
                    color: Colors.white.withAlpha(150),
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        elevation: 4,
        color: Constants.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset("assets/images/poster1.jpg", height: 250),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Star Citizen",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "Star Citizen",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

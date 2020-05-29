import 'dart:math';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttergame/api_service.dart';
import 'package:fluttergame/details_sheet.dart';
import 'package:fluttergame/game.dart';
import 'package:intl/intl.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crack watch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "ReemKufi",
        textTheme: TextTheme(
          subtitle1: TextStyle(fontFamily: "ReemKufi"),
        ),
        primaryColor: Constants.primaryColor,
        accentColor: Constants.accentColor,
        primarySwatch: Colors.blue,
        canvasColor: Constants.accentColor,
        appBarTheme: AppBarTheme(
          color: Constants.primaryColor,
          textTheme: TextTheme(
            subtitle1: TextStyle(fontFamily: "ReemKufi"),
          ),
        ),
      ),
      home: SafeArea(
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  Map<String, String> gameTypes = {
    "Cracked": "is_cracked=true",
    "Not Cracked": "is_cracked=false",
    "All": "",
  };

  final ctrl = ScrollController();

  static const gameStatusType = ["Cracked", "Not Cracked", "All"];
  static const gamesType = ["AAA", "Indie", "Both"];

  String gameStatus = gameStatusType[0];
  String gameType = gamesType[0];
  int page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.backgroundColor,
      body: Container(
        child: FutureBuilder(
          future:
              ApiService().getData(gameType: gameType, gameStatus: gameStatus),
          builder: (BuildContext context, AsyncSnapshot<List<Game>> snapshot) {
            if (snapshot.data == null)
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              );
            else if (snapshot.data.length == 0)
              return Container(
                height: kToolbarHeight + 10,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withAlpha(255),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Constants.primaryColor,
                      Constants.primaryColor.withAlpha(100),
                    ],
                    stops: [0.0, 1.0],
                  ),
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
                      Container(),
                    ]),
              );
            else {
              return CustomScrollView(
                controller: ctrl,
                slivers: <Widget>[
                  SliverAppBar(
                    floating: true,
                    pinned: false,
                    leading: SizedBox(),
                    snap: true,
                    backgroundColor: Colors.transparent.withAlpha(0),
                    expandedHeight: 125.0,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Container(
                        height: 125,
                        decoration: BoxDecoration(
                          color: Constants.primaryColor.withAlpha(255),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: <Color>[
                              Constants.primaryColor,
                              Constants.primaryColor.withAlpha(100),
                            ],
                            stops: [0.0, 1.0],
                          ),
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
                                  "Crack watch",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ),
                              Container(
                                height: kToolbarHeight,
                                child: ListView(
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    Container(
                                      width: 200,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          color: Constants.primaryColor),
                                      child: DropdownButton<String>(
                                        value: gameStatus,
                                        underline: SizedBox(),
                                        style: TextStyle(color: Colors.white),
                                        isExpanded: true,
                                        icon: Image.asset(
                                          "assets/images/arrow.png",
                                          width: 14,
                                        ),
                                        items: gameStatusType.map((value) {
                                          return DropdownMenuItem<String>(
                                            child: Container(
                                              padding: EdgeInsets.all(4),
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    fontFamily: "ReemKufi",
                                                    color: Colors.white),
                                              ),
                                            ),
                                            value: value,
                                          );
                                        }).toList(),
                                        onChanged: (val) {
                                          setState(() {
                                            gameStatus = val;
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 200,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 4),
                                      margin: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(32),
                                          color: Constants.primaryColor),
                                      child: DropdownButton<String>(
                                        value: gameType,
                                        underline: SizedBox(),
                                        style: TextStyle(color: Colors.white),
                                        isExpanded: true,
                                        icon: Image.asset(
                                          "assets/images/arrow.png",
                                          width: 14,
                                        ),
                                        items: gamesType.map((value) {
                                          return DropdownMenuItem<String>(
                                            child: Container(
                                              padding: EdgeInsets.all(4),
                                              child: Text(
                                                value,
                                                style: TextStyle(
                                                    fontFamily: "ReemKufi",
                                                    color: Colors.white),
                                              ),
                                            ),
                                            value: value,
                                          );
                                        }).toList(),
                                        onChanged: (val) {
                                          setState(() {
                                            gameType = val;
                                          });
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Item(
                        game: snapshot.data[index],
                      );
                    }, childCount: snapshot.data.length),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}

class Item extends StatefulWidget {
  final Game game;

  Item({this.game});

  @override
  _ItemState createState() => _ItemState(game);
}

class _ItemState extends State<Item> {
  final Game game;

  _ItemState(this.game);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.white,
      onTap: () {
        DetailsSheet.detailsSheet(context, game);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        elevation: 4,
        color: Constants.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Container(
                width: 180,
                child: CachedNetworkImage(
                  imageUrl: game.imagePoster,
                  fit: BoxFit.cover,
                  fadeInCurve: Curves.easeIn,
                  errorWidget: (context, wig, str) => Center(
                    child: Icon(
                      Icons.error_outline,
                      color: Colors.white,
                    ),
                  ),
                  placeholder: (context, str) => Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Text(
                          game.title ?? "n/a",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.white),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          ("Release Date \n ${DateFormat().add_yMMMd().format(game.releaseDate)}") ??
                              "n/a",
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

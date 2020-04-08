import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'game.dart';

class DetailsBottomSheet extends StatelessWidget {
  final Game game;

  DetailsBottomSheet({this.game});

  @override
  Widget build(BuildContext context) {
    print(game.crackDate);
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.only(top: 100),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
              ),
              color: Colors.white.withAlpha(150),
            ),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 100,
                  color: Colors.white,
                  height: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 6,
                    margin: EdgeInsets.all(0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl: game.image,
                        fit: BoxFit.cover,
                        fadeInCurve: Curves.easeIn,
                        errorWidget: (context, wig, str) => Center(
                          child: Icon(
                            Icons.error_outline,
                            color: Colors.white,
                          ),
                        ),
                        placeholder: (context, str) => Center(
                          child: Container(height: 100,child: Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),))),
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: 6,
                  margin: EdgeInsets.all(8.0),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(8.0),
                      margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                      child: Text(
                        game.title,
                        style: TextStyle(fontSize: 18),
                      )),
                ),
                Card(
                  elevation: 6,
                  color: Theme.of(context).accentColor,
                  margin: EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(8.0),
                    margin: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
                    child: Column(
                      children: <Widget>[

                        _buildDetailItem(
                            detailInfo: DateFormat()
                                .add_yMMMd()
                                .format(game.releaseDate),
                            itemDetailText: "Release Date"),

                        game.steamPrice == null
                            ? Container()
                            :_buildDetailItem(
                            detailInfo:"${game.steamPrice}\$",
                            itemDetailText: "Steam price"),

                        game.crackDate == null
                            ? Container()
                            : _buildDetailItem(
                                detailInfo: DateFormat()
                                    .add_yMMMd()
                                    .format(game.crackDate),
                                color:Colors.green[500],
                                itemDetailText: "Cracked Date"),
                        game.crackDate == null
                            ? Text(
                                "Not cracked yet",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold),
                              )
                            : Container(),

                        game.groups != null ?
                        _buildDetailItem(itemDetailText: "Group", detailInfo: game.groups.join("")):Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDetailItem({String itemDetailText,String detailInfo, Color color=Colors.white}) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[

          Text(
            itemDetailText,
            style: TextStyle(fontSize: 18, color: color),
          ),
          Text(
            detailInfo,
            style: TextStyle(fontSize: 18, color: color),
          ),
        ],
      ),
    );
  }
}

class DetailsSheet {
  static detailsSheet(context, game) => showBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return DetailsBottomSheet(game: game);
      });
}

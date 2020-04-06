import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttergame/game.dart';

class ApiService {
  final client = Dio();

  Future<List<Game>> getData({String gameStatus}) async {

    print("$gameStatus");

    String a="";
    if(gameStatus =="Cracked") a = "is_cracked=true&sort_by=crack_date";
    else if (gameStatus =="Not Cracked") a= "is_cracked=false";
    else a = "sort_by=release_date";

    var response = await client.get("https://api.crackwatch.com/api/games?$a");
    print(response.statusCode);
    print(response.statusMessage);

    List<Game> gameList = List<Game>();
    Iterable iterable = response.data;
    iterable.forEach((element) {

      gameList.add(Game.fromJson(element));

    });

    print("Games size ${gameList.length}");
    return gameList;
  }

}

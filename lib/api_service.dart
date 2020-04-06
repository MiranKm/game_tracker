import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttergame/game.dart';

class ApiService {
  final client = Dio();

  Future<List<Game>> getData({String gameStatus}) async {

    String a="";
    print("$gameStatus");
    if(gameStatus =="Cracked") a = "is_cracked=true";
    else if (gameStatus =="Cracked") a= "is_cracked=false";
    else a = "";

    var response = await client.get("https://api.crackwatch.com/api/games?${a}");
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

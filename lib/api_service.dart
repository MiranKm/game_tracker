import 'package:dio/dio.dart';
import 'package:fluttergame/game.dart';

class ApiService {
  final client = Dio();
  List<Game> gameList = List<Game>();

  Future<List<Game>> getData({int page=0,String gameStatus, String gameType}) async {
//    print("$gameStatus");
    print("$gameType");

    String a = "";

    if (gameStatus == "Cracked")
      a += "is_cracked=true&sort_by=crack_date";
    else if (gameStatus == "Not Cracked")
      a += "is_cracked=false";
    else
      a += "sort_by=release_date";
    if (gameType == "AAA") a += "&is_aaa=true";
    if (gameType == "indie") a += "&is_aaa=false";

    var response = await client.get("https://api.crackwatch.com/api/games?$a&page=$page");
    print(response.statusCode);
    print(response.statusMessage);

    Iterable iterable = response.data;
    iterable.forEach((element) {
      gameList.add(Game.fromJson(element));
    });

    return gameList;
  }
}

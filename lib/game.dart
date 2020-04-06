// To parse this JSON data, do
//
//     final game = gameFromJson(jsonString);

import 'dart:convert';

List<Game> gameFromJson(String str) => List<Game>.from(json.decode(str).map((x) => Game.fromJson(x)));

String gameToJson(List<Game> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Game {
  String id;
  String title;
  String slug;
  DateTime releaseDate;
  List<String> protections;
  List<String> versions;
  String image;
  String imagePoster;
  bool isAaa;
  int nfOsCount;
  int commentsCount;
  int followersCount;
  List<dynamic> groups;
  DateTime updatedAt;
  String url;
  int steamPrice;

  Game({
    this.id,
    this.title,
    this.slug,
    this.releaseDate,
    this.protections,
    this.versions,
    this.image,
    this.imagePoster,
    this.isAaa,
    this.nfOsCount,
    this.commentsCount,
    this.followersCount,
    this.groups,
    this.updatedAt,
    this.url,
    this.steamPrice,
  });

  factory Game.fromJson(Map<String, dynamic> json) => Game(
    id: json["_id"] == null ? null : json["_id"],
    title: json["title"] == null ? null : json["title"],
    slug: json["slug"] == null ? null : json["slug"],
    releaseDate: json["releaseDate"] == null ? null : DateTime.parse(json["releaseDate"]),
    protections: json["protections"] == null ? null : List<String>.from(json["protections"].map((x) => x)),
    versions: json["versions"] == null ? null : List<String>.from(json["versions"].map((x) => x)),
    image: json["image"] == null ? null : json["image"],
    imagePoster: json["imagePoster"] == null ? null : json["imagePoster"],
    isAaa: json["isAAA"] == null ? null : json["isAAA"],
    nfOsCount: json["NFOsCount"] == null ? null : json["NFOsCount"],
    commentsCount: json["commentsCount"] == null ? null : json["commentsCount"],
    followersCount: json["followersCount"] == null ? null : json["followersCount"],
    groups: json["groups"] == null ? null : List<dynamic>.from(json["groups"].map((x) => x)),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    url: json["url"] == null ? null : json["url"],
    steamPrice: json["steamPrice"] == null ? null : json["steamPrice"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "title": title == null ? null : title,
    "slug": slug == null ? null : slug,
    "releaseDate": releaseDate == null ? null : releaseDate.toIso8601String(),
    "protections": protections == null ? null : List<dynamic>.from(protections.map((x) => x)),
    "versions": versions == null ? null : List<dynamic>.from(versions.map((x) => x)),
    "image": image == null ? null : image,
    "imagePoster": imagePoster == null ? null : imagePoster,
    "isAAA": isAaa == null ? null : isAaa,
    "NFOsCount": nfOsCount == null ? null : nfOsCount,
    "commentsCount": commentsCount == null ? null : commentsCount,
    "followersCount": followersCount == null ? null : followersCount,
    "groups": groups == null ? null : List<dynamic>.from(groups.map((x) => x)),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "url": url == null ? null : url,
    "steamPrice": steamPrice == null ? null : steamPrice,
  };
}

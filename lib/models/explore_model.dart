// To parse this JSON data, do
//
//     final explore = exploreFromJson(jsonString);

import 'dart:convert';

List<Explore> exploreFromJson(String str) =>
    List<Explore>.from(json.decode(str).map((x) => Explore.fromJson(x)));

String exploreToJson(List<Explore> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Explore {
  final String category;
  final String refrence;
  final String english;
  final String arabic;

  Explore({
    required this.category,
    required this.refrence,
    required this.english,
    required this.arabic,
  });

  factory Explore.fromJson(Map<String, dynamic> json) => Explore(
        category: json["Category"],
        refrence: json["Refrence"],
        english: json["English"],
        arabic: json["Arabic"],
      );

  Map<String, dynamic> toJson() => {
        "Category": category,
        "Refrence": refrence,
        "English": english,
        "Arabic": arabic,
      };
}

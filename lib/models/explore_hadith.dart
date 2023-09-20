// To parse this JSON data, do
//
//     final exploreHadith = exploreHadithFromJson(jsonString);

import 'dart:convert';

List<ExploreHadith> exploreHadithFromJson(String str) =>
    List<ExploreHadith>.from(
        json.decode(str).map((x) => ExploreHadith.fromJson(x)));

String exploreHadithToJson(List<ExploreHadith> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ExploreHadith {
  final String? category;
  final String? refrence;
  final String? text;

  ExploreHadith({
    this.category,
    this.refrence,
    this.text,
  });

  factory ExploreHadith.fromJson(Map<String, dynamic> json) => ExploreHadith(
        category: json["Category"],
        refrence: json["Refrence"],
        text: json["Text"],
      );

  Map<String, dynamic> toJson() => {
        "Category": category,
        "Refrence": refrence,
        "Text": text,
      };
}

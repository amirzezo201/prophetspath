// To parse this JSON data, do
//
//     final emotionModel = emotionModelFromJson(jsonString);

import 'dart:convert';

List<EmotionModel> emotionModelFromJson(String str) => List<EmotionModel>.from(
    json.decode(str).map((x) => EmotionModel.fromJson(x)));

String emotionModelToJson(List<EmotionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmotionModel {
  EmotionModel({
    required this.id,
    required this.title,
    required this.categories,
    required this.arabic,
    required this.translation,
    required this.transliteration,
    required this.reference,
    required this.virtue,
  });

  int id;
  String title;
  String categories;
  String arabic;
  String translation;
  String transliteration;
  String reference;
  String virtue;

  factory EmotionModel.fromJson(Map<String, dynamic> json) => EmotionModel(
        id: json["id"],
        title: json["title"],
        categories: json["categories"],
        arabic: json["arabic"],
        translation: json["translation"],
        transliteration: json["transliteration"],
        reference: json["reference"],
        virtue: json["virtue"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "categories": categories,
        "arabic": arabic,
        "translation": translation,
        "transliteration": transliteration,
        "reference": reference,
        "virtue": virtue,
      };
}

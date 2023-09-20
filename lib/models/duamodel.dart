import 'dart:convert';

List<DuaModel> duaModelFromJson(String str) =>
    List<DuaModel>.from(json.decode(str).map((x) => DuaModel.fromJson(x)));

String duaModelToJson(List<DuaModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DuaModel {
  DuaModel({
    required this.id,
    required this.title,
    required this.categories,
    required this.arabic,
    required this.translation,
    required this.transliteration,
    required this.reference,
    required this.virtue,
  });

  var id;
  String title;
  var categories;
  String arabic;
  String translation;
  String transliteration;
  String reference;
  String virtue;

  factory DuaModel.fromJson(Map<String, dynamic> json) => DuaModel(
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

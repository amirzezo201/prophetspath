import 'dart:convert';

List<KidsVideoModel> kidsVideoModelFromJson(String str) =>
    List<KidsVideoModel>.from(
        json.decode(str).map((x) => KidsVideoModel.fromJson(x)));

String kidsVideoModelToJson(List<KidsVideoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KidsVideoModel {
  KidsVideoModel({
    required this.id,
    required this.name,
    required this.description,
    required this.video,
    required this.videothumbnail,
  });

  int id;
  String name;
  String description;
  String video;
  String videothumbnail;

  factory KidsVideoModel.fromJson(Map<String, dynamic> json) => KidsVideoModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        video: json["video"],
        videothumbnail: json["videothumbnail"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "video": video,
        "videothumbnail": videothumbnail,
      };
}

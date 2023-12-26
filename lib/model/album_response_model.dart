import 'dart:convert';

List<AlbumResponseModel> albumModelFromJson(String str) =>
    List<AlbumResponseModel>.from(
        json.decode(str).map((x) => AlbumResponseModel.fromJson(x)));

String albumModelToJson(List<AlbumResponseModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AlbumResponseModel {
  int? userId;
  int? id;
 String? title;

  AlbumResponseModel({
    this.userId,
    this.id,
   this.title,
  });

  factory AlbumResponseModel.fromJson(Map<String, dynamic> json) =>
      AlbumResponseModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}

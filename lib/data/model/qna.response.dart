// To parse this JSON data, do
//
//     final questionAnswerResponse = questionAnswerResponseFromJson(jsonString);

import 'dart:convert';

QuestionAnswerResponse questionAnswerResponseFromJson(String str) => QuestionAnswerResponse.fromJson(json.decode(str));

String questionAnswerResponseToJson(QuestionAnswerResponse data) => json.encode(data.toJson());

class QuestionAnswerResponse {
    bool success;
    String message;
    List<Datum> data;

    QuestionAnswerResponse({
        required this.success,
        required this.message,
        required this.data,
    });

    factory QuestionAnswerResponse.fromJson(Map<String, dynamic> json) => QuestionAnswerResponse(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String title;
    String description;
    int status;
    String userName;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.title,
        required this.description,
        required this.status,
        required this.userName,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        status: json["status"],
        userName: json["user_name"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "status": status,
        "user_name": userName,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

// To parse this JSON data, do
//
//     final doctorCategoryResponse = doctorCategoryResponseFromJson(jsonString);

import 'dart:convert';

DoctorCategoryResponse doctorCategoryResponseFromJson(String str) => DoctorCategoryResponse.fromJson(json.decode(str));

String doctorCategoryResponseToJson(DoctorCategoryResponse data) => json.encode(data.toJson());

class DoctorCategoryResponse {
    bool success;
    String message;
    List<Datum> data;

    DoctorCategoryResponse({
        required this.success,
        required this.message,
        required this.data,
    });

    factory DoctorCategoryResponse.fromJson(Map<String, dynamic> json) => DoctorCategoryResponse(
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
    String name;
    String imageUrl;

    Datum({
        required this.id,
        required this.name,
        required this.imageUrl,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image_url": imageUrl,
    };
}

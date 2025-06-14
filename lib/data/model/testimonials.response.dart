// To parse this JSON data, do
//
//     final testimonialResponse = testimonialResponseFromJson(jsonString);

import 'dart:convert';

TestimonialResponse testimonialResponseFromJson(String str) => TestimonialResponse.fromJson(json.decode(str));

String testimonialResponseToJson(TestimonialResponse data) => json.encode(data.toJson());

class TestimonialResponse {
    bool success;
    String message;
    Data data;

    TestimonialResponse({
        required this.success,
        required this.message,
        required this.data,
    });

    factory TestimonialResponse.fromJson(Map<String, dynamic> json) => TestimonialResponse(
        success: json["success"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    List<Featured> featured;
    List<Testimonial> testimonials;

    Data({
        required this.featured,
        required this.testimonials,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        featured: List<Featured>.from(json["featured"].map((x) => Featured.fromJson(x))),
        testimonials: List<Testimonial>.from(json["testimonials"].map((x) => Testimonial.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "featured": List<dynamic>.from(featured.map((x) => x.toJson())),
        "testimonials": List<dynamic>.from(testimonials.map((x) => x.toJson())),
    };
}

class Featured {
    int id;
    String title;
    int status;
    String imageUrl;

    Featured({
        required this.id,
        required this.title,
        required this.status,
        required this.imageUrl,
    });

    factory Featured.fromJson(Map<String, dynamic> json) => Featured(
        id: json["id"],
        title: json["title"],
        status: json["status"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "status": status,
        "image_url": imageUrl,
    };
}

class Testimonial {
    int id;
    String title;
    String subTitle;
    String doctorName;
    String doctorProfession;
    String hospitalName;
    String review;
    int status;
    String imageUrl;

    Testimonial({
        required this.id,
        required this.title,
        required this.subTitle,
        required this.doctorName,
        required this.doctorProfession,
        required this.hospitalName,
        required this.review,
        required this.status,
        required this.imageUrl,
    });

    factory Testimonial.fromJson(Map<String, dynamic> json) => Testimonial(
        id: json["id"],
        title: json["title"],
        subTitle: json["sub_title"],
        doctorName: json["doctor_name"],
        doctorProfession: json["doctor_profession"],
        hospitalName: json["hospital_name"],
        review: json["review"],
        status: json["status"],
        imageUrl: json["image_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "sub_title": subTitle,
        "doctor_name": doctorName,
        "doctor_profession": doctorProfession,
        "hospital_name": hospitalName,
        "review": review,
        "status": status,
        "image_url": imageUrl,
    };
}

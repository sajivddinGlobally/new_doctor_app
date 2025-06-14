// To parse this JSON data, do
//
//     final perticulerDoctorResponse = perticulerDoctorResponseFromJson(jsonString);

import 'dart:convert';

PerticulerDoctorResponse perticulerDoctorResponseFromJson(String str) => PerticulerDoctorResponse.fromJson(json.decode(str));

String perticulerDoctorResponseToJson(PerticulerDoctorResponse data) => json.encode(data.toJson());

class PerticulerDoctorResponse {
    bool status;
    String message;
    DoctorDetails doctorDetails;
    List<SuccessStory> successStories;
    ClinicStory clinicStory;
    AboutDoctor aboutDoctor;
    List<String> service;

    PerticulerDoctorResponse({
        required this.status,
        required this.message,
        required this.doctorDetails,
        required this.successStories,
        required this.clinicStory,
        required this.aboutDoctor,
        required this.service,
    });

    factory PerticulerDoctorResponse.fromJson(Map<String, dynamic> json) => PerticulerDoctorResponse(
        status: json["status"],
        message: json["message"],
        doctorDetails: DoctorDetails.fromJson(json["doctor_details"]),
        successStories: List<SuccessStory>.from(json["success_stories"].map((x) => SuccessStory.fromJson(x))),
        clinicStory: ClinicStory.fromJson(json["clinic_story"]),
        aboutDoctor: AboutDoctor.fromJson(json["about_doctor"]),
        service: List<String>.from(json["service"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "doctor_details": doctorDetails.toJson(),
        "success_stories": List<dynamic>.from(successStories.map((x) => x.toJson())),
        "clinic_story": clinicStory.toJson(),
        "about_doctor": aboutDoctor.toJson(),
        "service": List<dynamic>.from(service.map((x) => x)),
    };
}

class AboutDoctor {
    String education;
    List<String> specialization;
    List<String> membership;
    String registrationNo;
    List<dynamic> experiences;
    dynamic formattedFee;

    AboutDoctor({
        required this.education,
        required this.specialization,
        required this.membership,
        required this.registrationNo,
        required this.experiences,
        required this.formattedFee,
    });

    factory AboutDoctor.fromJson(Map<String, dynamic> json) => AboutDoctor(
        education: json["education"],
        specialization: List<String>.from(json["specialization"].map((x) => x)),
        membership: List<String>.from(json["membership"].map((x) => x)),
        registrationNo: json["registration_no"],
        experiences: List<dynamic>.from(json["experiences"].map((x) => x)),
        formattedFee: json["formatted_fee"],
    );

    Map<String, dynamic> toJson() => {
        "education": education,
        "specialization": List<dynamic>.from(specialization.map((x) => x)),
        "membership": List<dynamic>.from(membership.map((x) => x)),
        "registration_no": registrationNo,
        "experiences": List<dynamic>.from(experiences.map((x) => x)),
        "formatted_fee": formattedFee,
    };
}

class ClinicStory {
    String name;
    dynamic category;
    String image;
    DateTime createdAt;
    String timing;
    String fee;
    String dayType;
    String seatingDays;
    String weekType;
    String city;

    ClinicStory({
        required this.name,
        required this.category,
        required this.image,
        required this.createdAt,
        required this.timing,
        required this.fee,
        required this.dayType,
        required this.seatingDays,
        required this.weekType,
        required this.city,
    });

    factory ClinicStory.fromJson(Map<String, dynamic> json) => ClinicStory(
        name: json["name"],
        category: json["category"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        timing: json["timing"],
        fee: json["fee"],
        dayType: json["day_type"],
        seatingDays: json["seating_days"],
        weekType: json["week_type"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "category": category,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "timing": timing,
        "fee": fee,
        "day_type": dayType,
        "seating_days": seatingDays,
        "week_type": weekType,
        "city": city,
    };
}

class DoctorDetails {
    String name;
    String image;
    dynamic bio;
    String rating;
    String experience;
    String categoryName;

    DoctorDetails({
        required this.name,
        required this.image,
        required this.bio,
        required this.rating,
        required this.experience,
        required this.categoryName,
    });

    factory DoctorDetails.fromJson(Map<String, dynamic> json) => DoctorDetails(
        name: json["name"],
        image: json["image"],
        bio: json["bio"],
        rating: json["rating"],
        experience: json["experience"],
        categoryName: json["category_name"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "bio": bio,
        "rating": rating,
        "experience": experience,
        "category_name": categoryName,
    };
}

class SuccessStory {
    int id;
    int recommandedDoctor;
    String doctorId;
    String waitSeenDoctor;
    String whatYouHere;
    String tellUsAbout;
    int status;
    dynamic deletedAt;
    String createdAt;
    DateTime updatedAt;
    dynamic patientImage;

    SuccessStory({
        required this.id,
        required this.recommandedDoctor,
        required this.doctorId,
        required this.waitSeenDoctor,
        required this.whatYouHere,
        required this.tellUsAbout,
        required this.status,
        required this.deletedAt,
        required this.createdAt,
        required this.updatedAt,
        required this.patientImage,
    });

    factory SuccessStory.fromJson(Map<String, dynamic> json) => SuccessStory(
        id: json["id"],
        recommandedDoctor: json["recommanded_doctor"],
        doctorId: json["doctor_id"],
        waitSeenDoctor: json["wait_seen_doctor"],
        whatYouHere: json["what_you_here"],
        tellUsAbout: json["tell_us_about"],
        status: json["status"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        patientImage: json["patient_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "recommanded_doctor": recommandedDoctor,
        "doctor_id": doctorId,
        "wait_seen_doctor": waitSeenDoctor,
        "what_you_here": whatYouHere,
        "tell_us_about": tellUsAbout,
        "status": status,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "patient_image": patientImage,
    };
}

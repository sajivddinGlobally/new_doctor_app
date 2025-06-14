// To parse this JSON data, do
//
//     final doctoresResponse = doctoresResponseFromJson(jsonString);

import 'dart:convert';

DoctoresResponse doctoresResponseFromJson(String str) => DoctoresResponse.fromJson(json.decode(str));

String doctoresResponseToJson(DoctoresResponse data) => json.encode(data.toJson());

class DoctoresResponse {
    bool success;
    String message;
    List<Datum> data;
    Pagination pagination;

    DoctoresResponse({
        required this.success,
        required this.message,
        required this.data,
        required this.pagination,
    });

    factory DoctoresResponse.fromJson(Map<String, dynamic> json) => DoctoresResponse(
        success: json["success"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pagination: Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "pagination": pagination.toJson(),
    };
}

class Datum {
    int id;
    String firstName;
    String lastName;
    String age;
    Gender gender;
    String experience;
    String? category;
    String? hospitalName;
    String mobileNumber;
    Role role;
    String email;
    String stateId;
    String cityId;
    String pincode;
    String address;
    int status;
    String imageUrl;
    String state;
    String city;

    Datum({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.age,
        required this.gender,
        required this.experience,
        required this.category,
        required this.hospitalName,
        required this.mobileNumber,
        required this.role,
        required this.email,
        required this.stateId,
        required this.cityId,
        required this.pincode,
        required this.address,
        required this.status,
        required this.imageUrl,
        required this.state,
        required this.city,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        age: json["age"],
        gender: genderValues.map[json["gender"]]!,
        experience: json["experience"],
        category: json["category"],
        hospitalName: json["hospital_name"],
        mobileNumber: json["mobile_number"],
        role: roleValues.map[json["role"]]!,
        email: json["email"],
        stateId: json["state_id"],
        cityId: json["city_id"],
        pincode: json["pincode"],
        address: json["address"],
        status: json["status"],
        imageUrl: json["image_url"],
        state: json["state"],
        city: json["city"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "age": age,
        "gender": genderValues.reverse[gender],
        "experience": experience,
        "category": category,
        "hospital_name": hospitalName,
        "mobile_number": mobileNumber,
        "role": roleValues.reverse[role],
        "email": email,
        "state_id": stateId,
        "city_id": cityId,
        "pincode": pincode,
        "address": address,
        "status": status,
        "image_url": imageUrl,
        "state": state,
        "city": city,
    };
}

enum Gender {
    F,
    M,
    O
}

final genderValues = EnumValues({
    "F": Gender.F,
    "M": Gender.M,
    "O": Gender.O
});

enum Role {
    DOCTOR
}

final roleValues = EnumValues({
    "doctor": Role.DOCTOR
});

class Pagination {
    int total;
    int perPage;
    int currentPage;
    int lastPage;
    dynamic nextPageUrl;
    dynamic prevPageUrl;

    Pagination({
        required this.total,
        required this.perPage,
        required this.currentPage,
        required this.lastPage,
        required this.nextPageUrl,
        required this.prevPageUrl,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        lastPage: json["last_page"],
        nextPageUrl: json["next_page_url"],
        prevPageUrl: json["prev_page_url"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "per_page": perPage,
        "current_page": currentPage,
        "last_page": lastPage,
        "next_page_url": nextPageUrl,
        "prev_page_url": prevPageUrl,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}

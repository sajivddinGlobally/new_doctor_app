// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    bool success;
    String message;
    Data data;

    LoginResponse({
        required this.success,
        required this.message,
        required this.data,
    });

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
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
    int id;
    String firstName;
    String lastName;
    int age;
    String gender;
    String mobileNumber;
    String email;
    String role;
    String userType;
    String stateName;
    String cityName;
    String pincode;
    String address;
    int status;
    String imageUrl;
    String token;
    PatientProfile patientProfile;

    Data({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.age,
        required this.gender,
        required this.mobileNumber,
        required this.email,
        required this.role,
        required this.userType,
        required this.stateName,
        required this.cityName,
        required this.pincode,
        required this.address,
        required this.status,
        required this.imageUrl,
        required this.token,
        required this.patientProfile,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        age: json["age"],
        gender: json["gender"],
        mobileNumber: json["mobile_number"],
        email: json["email"],
        role: json["role"],
        userType: json["user_type"],
        stateName: json["state_name"],
        cityName: json["city_name"],
        pincode: json["pincode"],
        address: json["address"],
        status: json["status"],
        imageUrl: json["image_url"],
        token: json["token"],
        patientProfile: PatientProfile.fromJson(json["patient_profile"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "age": age,
        "gender": gender,
        "mobile_number": mobileNumber,
        "email": email,
        "role": role,
        "user_type": userType,
        "state_name": stateName,
        "city_name": cityName,
        "pincode": pincode,
        "address": address,
        "status": status,
        "image_url": imageUrl,
        "token": token,
        "patient_profile": patientProfile.toJson(),
    };
}

class PatientProfile {
    dynamic bloodGroup;
    dynamic weight;
    dynamic height;

    PatientProfile({
        required this.bloodGroup,
        required this.weight,
        required this.height,
    });

    factory PatientProfile.fromJson(Map<String, dynamic> json) => PatientProfile(
        bloodGroup: json["blood_group"],
        weight: json["weight"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "blood_group": bloodGroup,
        "weight": weight,
        "height": height,
    };
}

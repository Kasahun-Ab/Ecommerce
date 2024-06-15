// To parse this JSON data, do
//
//     final Profile = ProfileFromJson(jsonString);

import 'dart:convert';

Profile ProfileFromJson(String str) => Profile.fromJson(json.decode(str));

String ProfileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Data data;

  Profile({
    required this.data,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  String firstName;
  String lastName;
  String email;
  String gender;
  DateTime dateOfBirth;
  String phone;

  String image;

  Data({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.gender,
    required this.dateOfBirth,
    required this.phone,
    required this.image,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        phone: json["phone"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gender": gender,
        "date_of_birth":
            "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "image": image,
      };
}

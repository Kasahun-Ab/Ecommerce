// To parse this JSON data, do
//
//     final Customerdata = CustomerdataFromJson(jsonString);
// To parse this JSON data, do
//
//     final Customerdata = CustomerdataFromJson(jsonString);

import 'dart:convert';

Customerdata CustomerdataFromJson(String str) => Customerdata.fromJson(json.decode(str));

String CustomerdataToJson(Customerdata data) => json.encode(data.toJson());

class Customerdata {
    Data data;
    String message;
    String token;

    Customerdata({
        required this.data,
        required this.message,
        required this.token,
    });

    factory Customerdata.fromJson(Map<String, dynamic> json) => Customerdata(
        data: Data.fromJson(json["data"]),
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "token": token,
    };
}

class Data {
    int id;
    String email;
    String name;
    String firstName;
    String lastName;
    dynamic gender;
    dynamic dateOfBirth;
    String phone;
    String status;
    Group group;
    List<dynamic> notes;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.email,
        required this.name,
        required this.firstName,
        required this.lastName,
        required this.gender,
        required this.dateOfBirth,
        required this.phone,
        required this.status,
        required this.group,
        required this.notes,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        gender: json["gender"],
        dateOfBirth: json["date_of_birth"],
        phone: json["phone"],
        status: json["status"],
        group: Group.fromJson(json["group"]),
        notes: List<dynamic>.from(json["notes"].map((x) => x)),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "first_name": firstName,
        "last_name": lastName,
        "gender": gender,
        "date_of_birth": dateOfBirth,
        "phone": phone,
        "status": status,
        "group": group.toJson(),
        "notes": List<dynamic>.from(notes.map((x) => x)),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Group {
    int id;
    String name;
    dynamic createdAt;
    dynamic updatedAt;

    Group({
        required this.id,
        required this.name,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Group.fromJson(Map<String, dynamic> json) => Group(
        id: json["id"],
        name: json["name"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": createdAt,
        "updated_at": updatedAt,
    };
}

// To parse this JSON data, do
//
//     final Address = AddressFromJson(jsonString);

import 'dart:convert';


deliverAddress deliverAddressFromJson(String str) =>
    deliverAddress.fromJson(json.decode(str));

String deliverAddressToJson(deliverAddress data) => json.encode(data.toJson());

class deliverAddress {
  List<Datum>? data;

  deliverAddress({
    this.data,
  });

  factory deliverAddress.fromJson(Map<String, dynamic> json) => deliverAddress(
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  int? id;
  String? firstName;
  String? lastName;
  String? companyName;
  String? vatId;
  List<String>? address;
  String? country;
  String? countryName;
  String? state;
  String? city;
  String? postcode;
  String? phone;
  String? email;
  bool? isDefault;

  Datum({
    this.id,
    this.firstName,
    this.lastName,
    this.companyName,
    this.vatId,
    this.address,
    this.country,
    this.countryName,
    this.state,
    this.city,
    this.postcode,
    this.phone,
    this.email,
    this.isDefault,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        companyName: json["company_name"],
        vatId: json["vat_id"],
        address: json["address"] == null
            ? []
            : List<String>.from(json["address"]!.map((x) => x)),
        country: json["country"],
        countryName: json["country_name"],
        state: json["state"],
        city: json["city"],
        postcode: json["postcode"],
        phone: json["phone"],
        email: json["email"],
        isDefault: (json["is_default"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "company_name": companyName,
        "vat_id": vatId,
        "address":
            address == null ? [] : List<dynamic>.from(address!.map((x) => x)),
        "country": country,
        "country_name": countryName,
        "state": state,
        "city": city,
        "postcode": postcode,
        "phone": phone,
        "email": email,
        "is_default": isDefault,
      };
}

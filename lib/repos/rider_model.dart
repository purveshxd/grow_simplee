// To parse this JSON data, do
//
//     final rider = riderFromJson(jsonString);

import 'dart:convert';

Rider riderFromJson(String str) => Rider.fromJson(json.decode(str));

String riderToJson(Rider data) => json.encode(data.toJson());

class Rider {
  final String? uuid;
  final String? name;
  final int? phoneNumber;
  final List<String>? localities;
  final String? address;
  final int? pinCode;
  final int? bankAccountNumber;
  final String? ifsc;
  final bool? isVerified;
  final RiderDocs? riderDocs;

  Rider({
    this.uuid,
    this.name,
    this.phoneNumber,
    this.localities,
    this.address,
    this.pinCode,
    this.bankAccountNumber,
    this.ifsc,
    this.isVerified = false,
    this.riderDocs,
  });

  Rider copyWith({
    String? uuid,
    String? name,
    int? phoneNumber,
    List<String>? localities,
    String? address,
    int? pinCode,
    int? bankAccountNumber,
    String? ifsc,
    bool? isVerified,
    RiderDocs? riderDocs,
  }) =>
      Rider(
        uuid: uuid ?? this.uuid,
        name: name ?? this.name,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        localities: localities ?? this.localities,
        address: address ?? this.address,
        pinCode: pinCode ?? this.pinCode,
        bankAccountNumber: bankAccountNumber ?? this.bankAccountNumber,
        ifsc: ifsc ?? this.ifsc,
        isVerified: isVerified ?? this.isVerified,
        riderDocs: riderDocs ?? this.riderDocs,
      );

  factory Rider.fromJson(Map<String, dynamic> json) => Rider(
        uuid: json["uuid"],
        name: json["name"],
        phoneNumber: json["phoneNumber"],
        localities: json["localities"] == null
            ? []
            : List<String>.from(json["localities"]!.map((x) => x)),
        address: json["address"],
        pinCode: json["pinCode"],
        bankAccountNumber: json["bankAccountNumber"],
        ifsc: json["ifsc"],
        isVerified: json["isVerified"],
        riderDocs: json["riderDocs"] == null
            ? null
            : RiderDocs.fromJson(json["riderDocs"]),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "name": name,
        "phoneNumber": phoneNumber,
        "localities": localities == null
            ? []
            : List<dynamic>.from(localities!.map((x) => x)),
        "address": address,
        "pinCode": pinCode,
        "bankAccountNumber": bankAccountNumber,
        "ifsc": ifsc,
        "isVerified": isVerified,
        "riderDocs": riderDocs?.toJson(),
      };
}

class RiderDocs {
  final String? aadharPath;
  final String? panCardPath;
  final String? dl;
  final String? bankCheque;
  final String? photo;

  RiderDocs({
    this.aadharPath,
    this.panCardPath,
    this.dl,
    this.bankCheque,
    this.photo,
  });

  RiderDocs copyWith({
    String? aadharPath,
    String? panCardPath,
    String? dl,
    String? bankCheque,
    String? photo,
  }) =>
      RiderDocs(
        aadharPath: aadharPath ?? this.aadharPath,
        panCardPath: panCardPath ?? this.panCardPath,
        dl: dl ?? this.dl,
        bankCheque: bankCheque ?? this.bankCheque,
        photo: photo ?? this.photo,
      );

  factory RiderDocs.fromJson(Map<String, dynamic> json) => RiderDocs(
        aadharPath: json["aadharPath"],
        panCardPath: json["panCardPath"],
        dl: json["dl"],
        bankCheque: json["bankCheque"],
        photo: json["photo"],
      );

  Map<String, dynamic> toJson() => {
        "aadharPath": aadharPath,
        "panCardPath": panCardPath,
        "dl": dl,
        "bankCheque": bankCheque,
        "photo": photo,
      };
}

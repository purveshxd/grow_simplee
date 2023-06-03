// To parse this JSON data, do
//
//     final rider = riderFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'rider_model.g.dart';

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




// Rider(
//             name: "Purvesh Dongarwar",
//             phoneNumber: 9146477923,
//             localities: ["Sadar", "Burdi", "Lokmanya Nagar"],
//             address:
//                 "CRPF Gate No.3, Hingna Road, Digdoh Hills Nagpur ( Maharashtra)",
//             pinCode: 440010,
//             bankAccountNumber: 39238765008,
//             ifsc: "SBIN0001169",
//             riderDocs: RiderDocs(
//               aadharPath: '',
//               bankCheque: '',
//               dl: '',
//               panCardPath: '',
//               photo: '',
//             ),
//           ),
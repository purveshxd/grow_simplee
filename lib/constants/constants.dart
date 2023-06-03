import 'package:flutter/material.dart';
import 'package:grow_simplee/screens/add_riders.dart';
import 'package:grow_simplee/screens/rider_profile.dart';
import 'package:grow_simplee/screens/riders_list.dart';
import 'package:grow_simplee/screens/upload_documents.dart';

class Constants {
  List<String> docsName = [
    'aadharPath',
    'bankCheque',
    'dl',
    'panCardPath',
    'photo'
  ];

  List<String> docslabel = [
    'Aadhar',
    'Bank Cheque',
    'DL',
    'Pan Card',
    'Photo',
  ];

  static final Map _docNameMap = {
    'aadharPath': "",
    'bankCheque': "",
    'dl': "",
    'panCardPath': "",
    'photo': ""
  };
  String getdocNameMap(String docName) {
    String location = _docNameMap[docName];
    return location;
  }

  void docNameMap(String name, String location) {
    _docNameMap[name] = location;
  }

  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const RiderLists(),
    '/addRider': (context) => const AddRiders(),
    '/uploadDocs': (context) => const UploadDocuments(),
    '/riderProfile': (context) => const RiderProfile(),
  };
}

// enum DocName {
//   aadharPath(),
//   bankCheque,
//   dl,
//   panCardPath,
//   photo,
// }

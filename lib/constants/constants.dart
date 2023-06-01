import 'package:flutter/material.dart';
import 'package:grow_simplee/screens/add_riders.dart';
import 'package:grow_simplee/screens/rider_profile.dart';
import 'package:grow_simplee/screens/riders_list.dart';
import 'package:grow_simplee/screens/upload_documents.dart';

class Constants {
  List inputNames = [
    "Name",
    "Phone Number",
    "Localities",
    "Current Address",
    "Current Pincode",
    "Band Account Number",
    "IFSC Number",
  ];

  Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => const RiderLists(),
    '/addRider': (context) => const AddRiders(),
    '/uploadDocs': (context) => const UploadDocuments(),
    '/riderProfile': (context) => const RiderProfile(),
  };

  // ListroutesStrings = [];
}

import 'package:flutter/material.dart';
import 'package:grow_simplee/screens/add_riders.dart';
import 'package:grow_simplee/screens/riders_list.dart';
import 'package:grow_simplee/widgets/custom_button.dart';
import 'package:grow_simplee/widgets/document_upload_fields.dart';
import 'package:grow_simplee/widgets/rider_list_tile.dart';

class UploadDocuments extends StatelessWidget {
  const UploadDocuments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Documents"),
      ),
      body: ListView(
        children: const [
          DocumentUploadField(
            label: 'Aadhar',
          ),
          DocumentUploadField(label: 'Pan Card'),
          DocumentUploadField(label: 'DL'),
          DocumentUploadField(label: 'Bank Cheque'),
          DocumentUploadField(label: 'Photo'),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.max,
          children: [
            MaterialButton(
              minWidth: (MediaQuery.of(context).size.width / 100) * 45,
              height: 50,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.blue.shade100,
              child: const Text("Back"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            CustomButton(
                label: "Save",
                null,
                navigateTo: () =>
                    Navigator.of(context).popUntil(ModalRoute.withName('/'))),
          ],
        ),
      ),
    );
  }
}

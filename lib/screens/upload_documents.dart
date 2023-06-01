import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grow_simplee/constants/constants.dart';
import 'package:grow_simplee/constants/constants.dart';
import 'package:grow_simplee/repos/rider_model.dart';
import 'package:grow_simplee/repos/rider_providers.dart';
import 'package:grow_simplee/widgets/custom_button.dart';
import 'package:grow_simplee/widgets/document_upload_fields.dart';
import 'package:image_picker/image_picker.dart';

class UploadDocuments extends ConsumerWidget {
  const UploadDocuments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final riderData = ref.watch(riderProvider);
    final ImagePicker picker = ImagePicker();

    void pickImage(RiderDocs riderDocs) {
      showModalBottomSheet(
          context: context,
          builder: (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("Camera"),
                    leading: const Icon(Icons.camera_alt_rounded),
                    onTap: () async {
                      try {
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.camera);

                        if (image == null) return;
                        final imageTemp = XFile(image.path);

                        ref
                            .read(riderProvider.notifier)
                            .addRiderDocs(riderData.last.uuid!, RiderDocs());
                      } on PlatformException catch (e) {
                        debugPrint('Failed to pick image: $e');
                      }
                    },
                  ),
                  ListTile(
                    title: const Text("Gallery"),
                    leading: const Icon(Icons.image),
                    onTap: () async {
                      try {
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.gallery);

                        if (image == null) return;
                        final imageTemp = XFile(image.path);

                        ref.read(riderProvider.notifier).addRiderDocs(
                            riderData.last.uuid!,
                            RiderDocs(aadharPath: imageTemp.path));
                      } on PlatformException catch (e) {
                        debugPrint('Failed to pick image: $e');
                      }
                    },
                  ),
                ],
              ));
    }

    void viewImage(String docName) {
      try {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Image.file(File('$riderData.last.riderDocs!.$docName')),
          ),
        );
      } on PlatformException catch (e) {
        debugPrint('Failed to load image: $e');
      }
    }

    RiderDocs riderDocs = RiderDocs();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Documents"),
      ),
      body: ListView.builder(
        itemCount: Constants().docslabel.length,
        itemBuilder: (context, index) => DocumentUploadField(
          onPressedAdd: () => pickImage(
              '$riderDocs.$Constants().docsName.elementAt(index)' as RiderDocs),
          label: Constants().docslabel.elementAt(index),
          onPressedView: () => viewImage(
            Constants().docsName.elementAt(index),
          ),
        ),
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

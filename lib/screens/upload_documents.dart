import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grow_simplee/constants/constants.dart';
import 'package:grow_simplee/repos/rider_model.dart';
import 'package:grow_simplee/repos/rider_providers.dart';
import 'package:grow_simplee/widgets/custom_button.dart';
import 'package:grow_simplee/widgets/document_upload_fields.dart';
import 'package:image_picker/image_picker.dart';
// import 'package:uuid/uuid.dart';

class UploadDocuments extends ConsumerWidget {
  const UploadDocuments({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Rider args = ModalRoute.of(context)!.settings.arguments as Rider;

    final ImagePicker picker = ImagePicker();
    final isAdded = ref.watch(docProvider);
    // View Image function
    void viewImage(String docName) {
      try {
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Image.file(
              File(
                Constants().getdocNameMap(docName),
              ),
            ),
            // child: Image.file(File('$riderData.last.riderDocs!.$docName')),
          ),
        );
      } on PlatformException catch (e) {
        debugPrint('Failed to load image: $e');
      }
    }

// pick image function
    void pickImage(int index) {
      showModalBottomSheet(
          // backgroundColor: Colors.amber,
          context: context,
          builder: (context) => ListView(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: const Text("Camera"),
                    leading: const Icon(Icons.camera_alt_rounded),
                    onTap: () async {
                      try {
                        final XFile? image =
                            await picker.pickImage(source: ImageSource.camera);

                        if (image == null) return;
                        var tempImage = XFile(image.path).path;

                        Constants().docNameMap(
                            Constants().docsName.elementAt(index), tempImage);
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
                        // final imageTemp = XFile(image.path);
                        var tempImage = XFile(image.path).path;

                        Constants().docNameMap(
                            Constants().docsName.elementAt(index), tempImage);

                        // var _newVal = ref
                        //     .watch(isDocAddedProvider.notifier)
                        //     .state[index] = true;
                        // print(_newVal);
                        // print(ref.watch(isDocAddedProvider));

                        // ref.read(isDocAddedProvider.notifier).update(
                        //   (state) {
                        //     state[index] = true;
                        //     return state;
                        //   },
                        // );
                        print(tempImage);
                      } on PlatformException catch (e) {
                        debugPrint('Failed to pick image: $e');
                      }
                    },
                  ),
                ],
              ));
    }

    // bool isUploaded(uuid, int index) {
    //  final docName = Constants().docsName.elementAt(index).characters;
    //   // if (riderData.elementAt(index).riderDocs!.) {
    //   } else {}
    //   return true;
    // }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Documents"),
      ),
      body: ListView.builder(
        itemCount: Constants().docslabel.length,
        itemBuilder: (context, index) => DocumentUploadField(
            index: index,
            isAdded:
                ref.watch(isAdded.elementAt(index) as ProviderListenable<bool>),
            label: Constants().docslabel.elementAt(index),
            onPressedAdd: () {
              pickImage(index);

              ref
                  .read(isAdded.elementAt(index).notifier)
                  .update((state) => true);
            },
            onPressedView: () =>
                viewImage(Constants().docsName.elementAt(index))),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
            CustomButton(label: "Save", null, navigateTo: () {
              // Saving rider info from previous page and also the rider documents
              ref.read(riderProvider.notifier).addRiderInfo(
                    args.copyWith(
                      riderDocs: RiderDocs(
                          aadharPath: Constants().docPath['aadharPath'],
                          bankCheque: Constants().docPath['bankCheque'],
                          dl: Constants().docPath['dl'],
                          panCardPath: Constants().docPath['panCardPath'],
                          photo: Constants().docPath['photo']),
                    ),
                  );

              // Navigation
              Navigator.of(context).popUntil(
                ModalRoute.withName('/'),
              );
            }),
          ],
        ),
      ),
    );
  }
}

//  ref.read(riderProvider.notifier).addRiderDocs(
//                             riderData.last.uuid!,
//                             RiderDocs(aadharPath: imageTemp.path));

//   children: [
//     DocumentUploadField(
//       onPressedAdd: () => pickImage(
//         RiderDocs(
//           aadharPath: Constants().docsName.elementAt(0),
//         ),
//       ),
//       label: Constants().docslabel.elementAt(0),
//       onPressedView: () => viewImage(
//         Constants().docsName.elementAt(0),
//       ),
//     ),
//     DocumentUploadField(
//       onPressedAdd: () => pickImage(
//           RiderDocs(bankCheque: Constants().docsName.elementAt(1))),
//       label: Constants().docslabel.elementAt(1),
//       onPressedView: () => viewImage(
//         Constants().docsName.elementAt(1),
//       ),
//     ),
//     DocumentUploadField(
//       onPressedAdd: () =>
//           pickImage(RiderDocs(dl: Constants().docsName.elementAt(2))),
//       label: Constants().docslabel.elementAt(2),
//       onPressedView: () => viewImage(
//         Constants().docsName.elementAt(2),
//       ),
//     ),
//     DocumentUploadField(
//       onPressedAdd: () => pickImage(
//           RiderDocs(panCardPath: Constants().docsName.elementAt(3))),
//       label: Constants().docslabel.elementAt(3),
//       onPressedView: () => viewImage(
//         Constants().docsName.elementAt(3),
//       ),
//     ),
//     DocumentUploadField(
//       onPressedAdd: () =>
//           pickImage(RiderDocs(photo: Constants().docsName.elementAt(4))),
//       label: Constants().docslabel.elementAt(4),
//       onPressedView: () => viewImage(
//         Constants().docsName.elementAt(4),
//       ),
//     ),
//   ],
// ),

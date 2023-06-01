import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grow_simplee/repos/rider_api.dart';
import 'package:grow_simplee/repos/rider_model.dart';
import 'package:grow_simplee/repos/rider_providers.dart';
import 'package:grow_simplee/widgets/custom_button.dart';
import 'package:grow_simplee/widgets/custom_text_fields.dart';
import 'package:uuid/uuid.dart';

class AddRiders extends ConsumerWidget {
  const AddRiders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneNoController = TextEditingController();
    TextEditingController localitiesController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController pincodeController = TextEditingController();
    TextEditingController bankAccController = TextEditingController();
    TextEditingController ifscController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Rider"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          CustomTextField(label: "Name", controller: nameController),
          CustomTextField(label: "Phone Number", controller: phoneNoController),
          CustomTextField(
              label: "Localities", controller: localitiesController),
          CustomTextField(
              label: "Current Address", controller: addressController),
          CustomTextField(
              label: "Current Pincode", controller: pincodeController),
          CustomTextField(
              label: "Bank Account Number", controller: bankAccController),
          CustomTextField(label: "IFSC", controller: ifscController),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // mainAxisSize: MainAxisSize.max,
          children: [
            CustomButton(label: "Next", null, navigateTo: () {
              Rider rider = Rider(
                  uuid: const Uuid().v4(),
                  name: nameController.text,
                  phoneNumber: int.parse(phoneNoController.text),
                  localities: [localitiesController.text],
                  address: addressController.text,
                  pinCode: int.parse(pincodeController.text),
                  bankAccountNumber: int.parse(bankAccController.text),
                  ifsc: ifscController.text,
                  riderDocs: RiderDocs(
                      aadharPath: '',
                      panCardPath: '',
                      dl: '',
                      bankCheque: '',
                      photo: ''));
              ref.read(riderProvider.notifier).addRiderInfo(rider);

              Navigator.pushNamed(context, '/uploadDocs');
            })
          ],
        ),
      ),
    );
  }
}

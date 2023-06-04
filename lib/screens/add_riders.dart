import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grow_simplee/constants/constants.dart';
import 'package:grow_simplee/repos/rider_model.dart';
import 'package:grow_simplee/repos/rider_providers.dart';
import 'package:grow_simplee/widgets/custom_button.dart';
import 'package:grow_simplee/widgets/custom_text_fields.dart';
import 'package:grow_simplee/widgets/multi_select_dropdown.dart';
import 'package:uuid/uuid.dart';

class AddRiders extends ConsumerWidget {
  const AddRiders({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localities = ref.watch(localitiesProvider);
    final selectedItems = ref.watch(selectedLocalitiesProvider);
    void _itemChange(String itemValue, bool isSelected) {
      if (isSelected) {
        ref.read(selectedLocalitiesProvider.notifier).update((state) {
          return state = [...state, itemValue];
        });
        // selectedItems.add(itemValue);
      } else {
        ref.read(selectedLocalitiesProvider.notifier).update((state) {
          return state = [
            for (final place in state)
              if (place == itemValue)
                state.remove(itemValue).toString()
              else
                place
          ];
        });
        selectedItems.remove(itemValue);
      }
    }

    final formKey = GlobalKey<FormState>();
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
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            CustomTextField(
              label: "Name",
              controller: nameController,
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                  return "Enter correct name";
                } else {
                  return null;
                }
              },
            ),
            CustomTextField(
              label: "Phone Number",
              controller: phoneNoController,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[6-9]\d{9}$').hasMatch(value)) {
                  return "Enter correct number";
                } else {
                  return null;
                }
              },
            ),
            InkWell(
              onTap: () => showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Select Topics'),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: localities
                          .map((item) => CheckboxListTile(
                                value: selectedItems.contains(item),
                                title: Text(item),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                onChanged: (isChecked) =>
                                    _itemChange(item, isChecked!),
                              ))
                          .toList(),
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, selectedItems),
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(15)),
                  child: const Text("Select localities")),
            ),
            CustomTextField(
              label: "Localities",
              controller: localitiesController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter address";
                } else {
                  return null;
                }
              },
            ),
            CustomTextField(
              label: "Current Address",
              controller: addressController,
              keyboardType: TextInputType.streetAddress,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter address";
                } else {
                  return null;
                }
              },
            ),
            CustomTextField(
              maxLength: 6,
              label: "Current Pincode",
              controller: pincodeController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[1-9][0-9]{5}$').hasMatch(value)) {
                  return "Enter correct pincode";
                } else {
                  return null;
                }
              },
            ),
            CustomTextField(
              label: "Bank Account Number",
              controller: bankAccController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty || !RegExp(r'^\d{9,18}$').hasMatch(value)) {
                  return "Enter correct Bank account number";
                } else {
                  return null;
                }
              },
            ),
            CustomTextField(
              label: "IFSC",
              controller: ifscController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              maxLength: 11,
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r'^[A-Z]{4}0[A-Z0-9]{6}$').hasMatch(value)) {
                  return "Enter ifsc";
                } else {
                  return null;
                }
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // mainAxisSize: MainAxisSize.max,
          children: [
            CustomButton(label: "Next", null, navigateTo: () {
              if (formKey.currentState!.validate()) {
                Rider rider = Rider(
                  isVerified: false,
                  uuid: const Uuid().v4(),
                  name: nameController.text,
                  phoneNumber: int.parse(phoneNoController.text),
                  localities: [localitiesController.text],
                  address: addressController.text,
                  pinCode: int.parse(pincodeController.text),
                  bankAccountNumber: int.parse(bankAccController.text),
                  ifsc: ifscController.text,
                );
                Navigator.pushNamed(context, '/uploadDocs', arguments: rider);
              }
            })
          ],
        ),
      ),
    );
  }
}

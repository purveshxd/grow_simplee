import 'package:flutter/material.dart';
import 'package:grow_simplee/widgets/custom_button.dart';
import 'package:grow_simplee/widgets/custom_text_fields.dart';

class AddRiders extends StatelessWidget {
  const AddRiders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add New Rider"),
        centerTitle: true,
      ),
      body: ListView(
        children: const [
          CustomTextField(label: "Name"),
          CustomTextField(label: "Phone Number"),
          CustomTextField(label: "Localities"),
          CustomTextField(label: "Current Address"),
          CustomTextField(label: "Current Pincode"),
          CustomTextField(label: "Bank Account Number"),
          CustomTextField(label: "IFSC"),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // mainAxisSize: MainAxisSize.max,
          children: [
            CustomButton(
              label: "Next",
              null,
              navigateTo: () => Navigator.pushNamed(context, '/uploadDocs'),
            )
          ],
        ),
      ),
    );
  }
}

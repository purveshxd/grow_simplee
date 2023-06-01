import 'package:flutter/material.dart';

class DocumentUploadField extends StatelessWidget {
  final String label;
  final  void Function()? onPressedView;
  final  void Function()? onPressedAdd;
  const DocumentUploadField({super.key, required this.label, this.onPressedView, this.onPressedAdd});

  @override
  Widget build(BuildContext context) {
    return Padding(
        // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
        child: Container(
          height: (MediaQuery.of(context).size.height / 100) * 8,
          decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              Checkbox(
                value: true,
                onChanged: (value) {
                  //
                },
              ),
              Text(label),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(onPressed: onPressedView, child: const Text("View")),
                  TextButton(onPressed: onPressedAdd, child: const Text("Add")),
                ],
              )
            ],
          ),
        ));
  }
}

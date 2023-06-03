// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  const CustomTextField({
    super.key,
    required this.label,
    required this.controller,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction = TextInputAction.next,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: TextField(
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        controller: controller,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          label: Text(label),
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String label;
  // ignore: prefer_typing_uninitialized_variables
  final color;
  final void Function()? navigateTo;
  const CustomButton(
    this.color, {
    Key? key,
    required this.label,
    required this.navigateTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return MaterialButton(
      minWidth: width / 100 * 45,
      height: 50,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: color ?? Colors.blue.shade100,
      onPressed: navigateTo,
      child: Text(label),
    );
  }
}

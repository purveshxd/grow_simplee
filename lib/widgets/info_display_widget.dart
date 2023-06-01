// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InfoDisplay extends StatelessWidget {
  final String label;
  const InfoDisplay({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          tileColor: Colors.blue.shade100,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Row(
            children: [Text("$label : "), const Text("Aman Gupta")],
          )),
    );
  }
}

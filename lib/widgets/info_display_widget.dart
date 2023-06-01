import 'package:flutter/material.dart';

class InfoDisplay extends StatelessWidget {
  final String label;
  final String info;
  const InfoDisplay({
    Key? key,
    required this.label,
    required this.info,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // debugPrint(info.runtimeType as String?);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
          tileColor: Colors.blue.shade100,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("$label : "),
              Expanded(child: Text(info is List ? "List" : info.toString()))
            ],
          )),
    );
  }
}

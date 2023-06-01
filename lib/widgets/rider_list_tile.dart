// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:grow_simplee/repos/rider_model.dart';


class RiderListTile extends StatelessWidget {
  final Rider rider;
  const RiderListTile({
    Key? key,
    required this.rider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: InkWell(
        onTap: () =>
            Navigator.pushNamed(context, '/riderProfile', arguments: rider),
        child: ListTile(
          title: Text(rider.name.toString()),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          tileColor: Colors.blue.shade100,
        ),
      ),
    );
  }
}

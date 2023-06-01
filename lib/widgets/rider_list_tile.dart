import 'package:flutter/material.dart';
import 'package:grow_simplee/screens/rider_profile.dart';

class RiderListTile extends StatelessWidget {
  const RiderListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: InkWell(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const RiderProfile(),
            )),
        child: ListTile(
          title: const Text("Aman Gupta"),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          tileColor: Colors.blue.shade100,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:grow_simplee/widgets/custom_button.dart';
import 'package:grow_simplee/widgets/rider_list_tile.dart';

class RiderLists extends StatelessWidget {
  const RiderLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Riders'),
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) => const RiderListTile(),
      ),
      bottomNavigationBar:  Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          // mainAxisSize: MainAxisSize.max,
          children: [
            CustomButton(
              label: "Add",
              null,
              navigateTo: () => Navigator.pushNamed(context, '/addRider'),
            )
          ],
        ),
      ),
    );
  }
}

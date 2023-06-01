import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grow_simplee/repos/rider_model.dart';
import 'package:grow_simplee/repos/rider_providers.dart';
import 'package:grow_simplee/widgets/custom_button.dart';
import 'package:grow_simplee/widgets/rider_list_tile.dart';

class RiderLists extends ConsumerWidget {
  const RiderLists({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Rider> riders = ref.watch(riderProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: TextButton(
          child: const Text('Riders'),
          onPressed: () {
            debugPrint(riders.elementAt(1).uuid.toString());
          },
        ),
      ),
      body: ListView.builder(
        itemCount: riders.length,
        itemBuilder: (context, index) =>
            RiderListTile(rider: riders.elementAt(index)),
      ),
      bottomNavigationBar: Padding(
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

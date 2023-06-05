import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grow_simplee/repos/rider_model.dart';
import 'package:grow_simplee/repos/rider_providers.dart';
import 'package:grow_simplee/widgets/rider_list_tile.dart';

class RiderLists extends ConsumerWidget {
  const RiderLists({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Rider> rejectedRider = ref.watch(rejectedRiderProvider);
    List<Rider> verifiedRider = ref.watch(verifiedRiderProvider);
    int currentPage = ref.watch(currentPageProvider);
    List<Widget> bodyList = [
      ListView.builder(
        itemCount: verifiedRider.length,
        itemBuilder: (context, index) =>
            RiderListTile(rider: verifiedRider.elementAt(index)),
      ),
      ListView.builder(
        itemCount: rejectedRider.length,
        itemBuilder: (context, index) =>
            RiderListTile(rider: rejectedRider.elementAt(index)),
      ),
    ];
    List pageName = ["Riders", "Unverified Riders"];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(pageName.elementAt(currentPage)),
      ),
      body: bodyList[currentPage],
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue.shade100,
        label: const Text("Add Rider"),
        onPressed: () => Navigator.pushNamed(context, '/addRider'),
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.blue.shade100,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        backgroundColor: Colors.blue.shade50,
        selectedIndex: currentPage,
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.check), label: 'Verified Riders'),
          NavigationDestination(
              icon: Icon(Icons.close), label: 'Unverified Riders')
        ],
        onDestinationSelected: (value) {
          ref.read(currentPageProvider.notifier).update((state) => value);
          // currentPage = value;
        },
      ),
    );
  }
}

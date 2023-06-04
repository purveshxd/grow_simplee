import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grow_simplee/constants/constants.dart';
import 'package:grow_simplee/repos/rider_model.dart';
import 'package:grow_simplee/widgets/custom_button.dart';
import 'package:grow_simplee/widgets/info_display_widget.dart';

class RiderProfile extends ConsumerWidget {
  const RiderProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // CarouselController carouselController = CarouselController();
    // final riderData = ref.watch(riderProvider);
    // riderData[index].riderDocs!.docName;
    // int noOfRiders = riderData.length;
    Rider rider = ModalRoute.of(context)!.settings.arguments as Rider;
    List imgLocation = [];
    // final docName = Constants().docsName.elementAt(noOfRiders);
    rider.riderDocs?.toJson().forEach((key, value) {
      imgLocation.add(value);
    });
    print(imgLocation);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rider Profile"),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blue.shade100,
              borderRadius: BorderRadius.circular(15),
            ),
            child: CarouselSlider.builder(
                itemCount: Constants().docsName.length,
                itemBuilder: (context, index, realIndex) {
                  return Image.file(
                    // width: double.infinity,
                    // height: MediaQuery.of(context).size.height / 2,
                    // fit: BoxFit.fitHeight,
                    // width: MediaQuery.of(context).size.shortestSide / 1.2,
                    File(imgLocation.elementAt(index)),
                  );
                },
                options: CarouselOptions(
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    aspectRatio: 4 / 5,
                    // height: MediaQuery.of(context).size.height / 2.6,
                    scrollPhysics: const BouncingScrollPhysics())),
          ),
          InfoDisplay(label: 'Name', info: rider.name.toString()),
          InfoDisplay(
            label: 'Phone Number',
            info: rider.phoneNumber.toString(),
          ),
          InfoDisplay(
            label: 'Address',
            info: rider.address.toString(),
          ),
          InfoDisplay(label: 'Localities', info: rider.localities.toString()),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // mainAxisSize: MainAxisSize.max,
          children: [
            MaterialButton(
                minWidth: (MediaQuery.of(context).size.width / 100) * 45,
                height: 50,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.red.shade100,
                child: const Text("Reject"),
                onPressed: () =>
                    Navigator.of(context).popUntil(ModalRoute.withName('/'))),
            CustomButton(
              null,
              label: "Accept",
              navigateTo: () =>
                  Navigator.of(context).popUntil(ModalRoute.withName('/')),
            ),
          ],
        ),
      ),
    );
  }
}

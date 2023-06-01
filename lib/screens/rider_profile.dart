import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:grow_simplee/widgets/custom_button.dart';
import 'package:grow_simplee/widgets/info_display_widget.dart';

class RiderProfile extends StatelessWidget {
  const RiderProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rider Profile")),
      body: ListView(
        children: [
          CarouselSlider.builder(
              itemCount: 5,
              itemBuilder: (context, index, realIndex) => Container(
                    margin: const EdgeInsets.all(10),
                    height: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.blue.shade100,
                    ),
                    width: double.infinity,
                    child: Center(child: Text(index.toString())),
                  ),
              options: CarouselOptions(
                  viewportFraction: 1, enableInfiniteScroll: false)),
          const InfoDisplay(label: 'Name'),
          const InfoDisplay(label: 'Phone Number'),
          const InfoDisplay(label: 'Address'),
          const InfoDisplay(label: 'Localities'),
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

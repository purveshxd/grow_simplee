// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grow_simplee/repos/rider_model.dart';
import 'package:grow_simplee/repos/rider_providers.dart';

class RiderListTile extends ConsumerWidget {
  final Rider rider;
  const RiderListTile({
    Key? key,
    required this.rider,
    // required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // bool isVerified() {
    //   if (rider.isVerified == true) {
    //     return true;
    //   } else {
    //     return false;
    //   }
    // }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Slidable(
        startActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            autoClose: true,
            borderRadius: BorderRadius.circular(15),
            onPressed: (context) {
              ref
                  .read(riderProvider.notifier)
                  .rejectRider(rider.uuid.toString());
            },
            backgroundColor: Colors.red.shade300,
            icon: Icons.close,
            label: 'Reject',
          ),
        ]),
        endActionPane: ActionPane(motion: const StretchMotion(), children: [
          SlidableAction(
            autoClose: true,
            borderRadius: BorderRadius.circular(15),
            onPressed: (context) {
              ref
                  .read(riderProvider.notifier)
                  .verifyRider(rider.uuid.toString());
            },
            backgroundColor: Colors.green.shade300,
            icon: Icons.check_rounded,
            label: 'Verify',
          ),
        ]),
        child: ListTile(
          onTap: () =>
              Navigator.pushNamed(context, '/riderProfile', arguments: rider),
          // trailing: isVerified()
          //     ? Container(
          //         height: 36,
          //         width: 88,
          //         padding: const EdgeInsets.all(8),
          //         decoration: BoxDecoration(
          //             color: Colors.green.shade300,
          //             borderRadius: BorderRadius.circular(20)),
          //         child: Text(
          //           "Verified",
          //           textAlign: TextAlign.center,
          //           style:
          //               TextStyle(fontSize: 15, color: Colors.green.shade900),
          //         ),
          //       )
          //     : MaterialButton(
          //         elevation: 0,
          //         shape: RoundedRectangleBorder(
          //             borderRadius: BorderRadius.circular(20)),
          //         color: Colors.red.shade300,
          //         onPressed: () {
          //           ref
          //               .read(riderProvider.notifier)
          //               .verifyRejectRider(rider.uuid.toString());
          //         },
          //         child: const Text('Verify'),
          //       ),
          title: Text(
            rider.name.toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          tileColor: Colors.blue.shade100,
        ),
      ),
    );
  }
}

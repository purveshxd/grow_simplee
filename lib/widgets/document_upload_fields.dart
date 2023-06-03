import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grow_simplee/constants/constants.dart';
import 'package:grow_simplee/repos/rider_providers.dart';

class DocumentUploadField extends StatelessWidget {
  final String label;
  final bool isAdded;
  final int index;
  final void Function()? onPressedView;
  final void Function()? onPressedAdd;
  const DocumentUploadField(
      {super.key,
      required this.isAdded,
      required this.label,
      this.onPressedView,
      this.onPressedAdd,
      required this.index});

  @override
  Widget build(BuildContext context) {
    // final isImageAddedVal = ref.watch(isDocAddedProvider);
    // bool isImageAdded() {
    //   if (Constants()
    //       .getdocNameMap(Constants().docsName.elementAt(index))
    //       .isEmpty) {
    //     // ref.read(isDocAddedProvider.notifier).update((state) => true);
    //     // isImageAddedVal = true;
    //     return false;
    //   } else {
    //     // ref.read(isDocAddedProvider.notifier).update((state) => true);
    //     // ref.read(isDocAddedProvider.notifier).state = false;
    //     // isImageAddedVal = false;
    //     return true;
    //   }
    // }

    return Padding(
      // padding: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7.5),
      child: Container(
        height: (MediaQuery.of(context).size.height / 100) * 8,
        decoration: BoxDecoration(
            color: Colors.blue.shade100,
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Checkbox(
              value: isAdded,
              onChanged: (value) {
                // ref.read(isDocAddedProvider.notifier).update((state) => ).elementAt(index);
              },
            ),
            Text(label),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                    onPressed: isAdded ? onPressedView : null,
                    child: const Text("View")),
                TextButton(onPressed: onPressedAdd, child: const Text("Add")),
              ],
            )
          ],
        ),
      ),
    );
  }
}

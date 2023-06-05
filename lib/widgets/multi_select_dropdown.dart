import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grow_simplee/repos/rider_providers.dart';

// class MultiSelect extends StatefulWidget {
//   // final List<String> items;
//   const MultiSelect(Key? key) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _MultiSelectState();
// }

// class _MultiSelectState extends State<MultiSelect> {
//   // this variable holds the selected items
//   final List<String> _selectedItems = [];

// // This function is triggered when a checkbox is checked or unchecked
//   void _itemChange(String itemValue, bool isSelected) {
//     if (isSelected) {
//       _selectedItems.add(itemValue);
//     } else {
//       _selectedItems.remove(itemValue);
//     }
//   }

//   // this function is called when the Cancel button is pressed
//   void _cancel() {
//     Navigator.pop(context);
//   }

// // this function is called when the Submit button is tapped
//   void _submit() {
//     Navigator.pop(context, _selectedItems);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Select Topics'),
//       content: SingleChildScrollView(
//         child: ListBody(
//           children: widget.items
//               .map((item) => CheckboxListTile(
//                     value: _selectedItems.contains(item),
//                     title: Text(item),
//                     controlAffinity: ListTileControlAffinity.leading,
//                     onChanged: (isChecked) => _itemChange(item, isChecked!),
//                   ))
//               .toList(),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: _cancel,
//           child: const Text('Cancel'),
//         ),
//         ElevatedButton(
//           onPressed: _submit,
//           child: const Text('Submit'),
//         ),
//       ],
//     );
//   }
// }

class MultiSelect extends ConsumerWidget {
  final List<String> items;
  const MultiSelect({super.key, required this.items});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedItems = ref.watch(selectedLocalitiesProvider);

// This function is triggered when a checkbox is checked or unchecked
    void itemChange(String itemValue, bool isSelected) {
      if (isSelected) {
        // _selectedItems.add(itemValue);
        ref.watch(selectedLocalitiesProvider.notifier).state.add(itemValue);
      } else {
        // _selectedItems.remove(itemValue);
        ref.watch(selectedLocalitiesProvider.notifier).state.remove(itemValue);
      }
    }



    // this function is called when the Cancel button is pressed
    void cancel() {
      Navigator.pop(context);
    }

// this function is called when the Submit button is tapped
    void submit() {
      Navigator.pop(context, selectedItems);
    }


   
    return AlertDialog(
      title: const Text('Select Topics'),
      content: SingleChildScrollView(
        child: ListBody(
          children: items
              .map((item) => CheckboxListTile(
                    value: selectedItems.contains(item),
                    title: Text(item),
                    controlAffinity: ListTileControlAffinity.leading,
                    onChanged: (isChecked) => itemChange(item, isChecked!),
                  ))
              .toList(),
        ),
      ),
      actions: [
        TextButton(
          onPressed: cancel,
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: submit,
          child: const Text('Submit'),
        ),
      ],
    );
  }
}

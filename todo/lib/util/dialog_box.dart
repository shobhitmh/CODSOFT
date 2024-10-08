import 'package:flutter/material.dart';
import 'package:todo/util/my_button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.deepPurple[200],
      content: SizedBox(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          // Get User Input
          TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Add a new task",
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Save Button
              MyButton(text: "Save", onPressed: onSave),

              const SizedBox(width: 10),

              // Cancel Button
              MyButton(text: "Cancel", onPressed: onCancel)
            ],
          )
        ]),
      ),
    );
  }
}

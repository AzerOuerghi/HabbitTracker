import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdateHabitBox extends StatelessWidget {
  final contrroller;
  final VoidCallback onupdate;

  const UpdateHabitBox(
      {super.key, required this.contrroller, required this.onupdate});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: const EdgeInsets.all(10),
      title: const Text('Update'),
      content: TextField(
        controller: contrroller,
      ),
      actions: [
        MaterialButton(
          onPressed: onupdate,
          color: const Color.fromARGB(255, 37, 37, 122),
          child: const Text('Modifie Task'),
          textColor: Colors.white,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EnterHabitBox extends StatelessWidget {
  const EnterHabitBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: const EdgeInsets.all(10),
      title: const Text('Add a Task'),
      content: const TextField(),
      actions: [
        MaterialButton(
          onPressed: () {},
          color: const Color.fromARGB(255, 37, 37, 122),
          child: const Text('Add Task'),
          textColor: Colors.white,
        )
      ],
    );
  }
}

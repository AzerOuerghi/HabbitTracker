import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EnterHabitBox extends StatelessWidget {
  final contrroller; 
  final   VoidCallback onsave ;

  const EnterHabitBox({
    super.key,required this.contrroller , required this.onsave });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      buttonPadding: const EdgeInsets.all(10),
      title: const Text('Add a Task'),
      content:  TextField(
        controller: contrroller,
      ),
      actions: [
        MaterialButton( 
          onPressed: onsave,
          color: const Color.fromARGB(255, 37, 37, 122),
          child: const Text('Add Task'),
          textColor: Colors.white,
        )
      ],
    );
  }
}

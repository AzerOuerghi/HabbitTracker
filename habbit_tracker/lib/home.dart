import 'package:flutter/material.dart';

import 'package:habbit_tracker/component/Habit_list.dart';

import 'component/EnterHabbitBox.dart';
import 'component/floatingbutton.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  List habbitList = [
    ['aazer', false],
    ['aazeeer', true],
  ];

  bool habitCompleted = false;

  void checkBoxTaped(bool? value, int index) {
    setState(() {
      habbitList[index][1] = value!;
    });
  }

  void AddTask() {
    showAboutDialog(context: context);
  }

  void SaveHabbit() {
    setState(() {
      habbitList.add([NewHabbitController.text, false]);
    });

    NewHabbitController.clear();
    Navigator.of(context).pop();
  }

  final NewHabbitController = TextEditingController();
  void CreateHabit() {
    showDialog(
        context: context,
        builder: ((context) {
          return EnterHabitBox(
            contrroller: NewHabbitController,
            onsave: SaveHabbit,
          );
        }));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FlowtingButton(onPressed: CreateHabit),
      backgroundColor: const Color.fromARGB(255, 37, 37, 122),
      body: ListView.builder(
        itemCount: habbitList.length,
        itemBuilder: (context, index) {
          return HabbitList(
              habbitName: habbitList[index][0],
              habitCompleted: habbitList[index][1],
              onChanged: (value) => checkBoxTaped(value, index));
        },
      ),
    );
  }
}

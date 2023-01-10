import 'package:flutter/material.dart';
import 'package:habbit_tracker/Data/HabitDatabase.dart';

import 'package:habbit_tracker/component/Habit_list.dart';
import 'package:habbit_tracker/component/MothlySumary.dart';
import 'package:hive/hive.dart';

import 'component/EnterHabbitBox.dart';
import 'component/ModifeHabbitBox.dart';
import 'component/floatingbutton.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  HabbitDatabase db = HabbitDatabase();
  final box = Hive.box('Box');

  void initState() {
    // if there is no current habit list, then it is the 1st time ever opening the app
    // then create default data
    if (box.get("habbitList") == null) {
      db.createDefaultData();
    }

    // there already exists data, this is not the first time
    else {
      db.loadData();
    }

    // update the database
    db.updateDatabase();

    super.initState();
  }

  void checkBoxTaped(bool? value, int index) {
    setState(() {
      db.habbitList[index][1] = value!;
    });
    db.updateDatabase();
  }

  void AddTask() {
    showAboutDialog(context: context);
  }

  void SaveHabbit() {
    setState(() {
      db.habbitList.add([NewHabbitController.text, false]);
    });

    NewHabbitController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void UpdateHabbit(int index) {
    setState(() {
      db.habbitList[index][0] = NewHabbitController.text;
    });

    NewHabbitController.clear();
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  void deleteHabbit(int index) {
    setState(() {
      db.habbitList.removeAt(index);
      db.updateDatabase();
    });
    db.updateDatabase();
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
    db.updateDatabase();
  }

  void UpdateHabit(int index) {
    showDialog(
        context: context,
        builder: ((context) {
          return UpdateHabitBox(
              contrroller: NewHabbitController,
              onupdate: (() => UpdateHabbit(index)));
        }));
    db.updateDatabase();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FlowtingButton(onPressed: CreateHabit),
      backgroundColor: const Color.fromARGB(255, 37, 37, 122),
      body: ListView(
        children: [
          MonthlySummary(
              datasets: db.heatMapDataSet, startDate: box.get("Start_date")),
          ListView.builder(
            shrinkWrap: true,
            itemCount: db.habbitList.length,
            itemBuilder: (context, index) {
              return HabbitList(
                habbitName: db.habbitList[index][0],
                habitCompleted: db.habbitList[index][1],
                onChanged: (value) => checkBoxTaped(value, index),
                delete: (Context) => deleteHabbit(index),
                setting: (Context) => UpdateHabit(index),
              );
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabbitList extends StatelessWidget {
  final String habbitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;

  const HabbitList(
      {super.key,
      required this.habbitName,
      required this.habitCompleted,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
            onPressed: (context) {},
            backgroundColor: Colors.grey,
            icon: Icons.settings),
        SlidableAction(
          onPressed: (context) {},
          backgroundColor: Colors.red,
          icon: Icons.delete,
        )
      ]),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              value: habitCompleted,
              onChanged: onChanged,
            ),
            (Text(habbitName)),
          ],
        ),
      ),
    );
  }
}

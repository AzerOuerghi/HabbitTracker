import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabbitList extends StatelessWidget {
  final String habbitName;
  final bool habitCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext) setting;
  final Function(BuildContext) delete;

  const HabbitList(
      {super.key,
      required this.habbitName,
      required this.habitCompleted,
      required this.onChanged,
      required this.delete,
      required this.setting});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: setting,
            backgroundColor: Colors.grey,
            icon: Icons.settings,
            borderRadius: BorderRadius.circular(8),
          ),
          SlidableAction(
            onPressed: delete,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(8),
          )
        ]),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.all(20),
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
      ),
    );
  }
}

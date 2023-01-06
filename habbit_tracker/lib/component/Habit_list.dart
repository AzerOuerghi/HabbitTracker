import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

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
    return Container(
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
    );
  }
}

import 'package:hive/hive.dart';

var box = Hive.openBox('testBox');

class HabbitDatabase {
  List TodayHabitList = [];

  void createDefaultData() {
    TodayHabitList = [
      ["Run", false],
      ["Read", false],
    ];
  }
}

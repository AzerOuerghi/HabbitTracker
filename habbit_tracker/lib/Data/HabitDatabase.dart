import 'package:habbit_tracker/days/days.dart';
import 'package:hive/hive.dart';

var box = Hive.box('Box');

class HabbitDatabase {
  List habbitList = [];
  Map<DateTime, int> heatMapDataSet = {};

  void createDefaultData() {
    habbitList = [
      ["Run", false],
      ["Read", false],
    ];
    box.put('Start_date', todaysDateFormatted());
  }

  void loadData() {
    if (box.get(todaysDateFormatted()) == null) {
      habbitList = box.get("habbitList");
      // set all habit completed to false since it's a new day
      for (int i = 0; i < habbitList.length; i++) {
        habbitList[i][1] = false;
      }
    }
    // if it's not a new day, load todays list
    else {
      habbitList = box.get(todaysDateFormatted());
    }
  }

  void updateDatabase() {
    box.put(todaysDateFormatted(), habbitList);

    // update universal habit list in case it changed (new habit, edit habit, delete habit)
    box.put("habbitList", habbitList);
  }

  void calculateHabitPercentages() {
    int countCompleted = 0;
    for (int i = 0; i < habbitList.length; i++) {
      if (habbitList[i][1] == true) {
        countCompleted++;
      }
    }

    String percent = habbitList.isEmpty
        ? '0.0'
        : (countCompleted / habbitList.length).toStringAsFixed(1);

    // key: "PERCENTAGE_SUMMARY_yyyymmdd"
    // value: string of 1dp number between 0.0-1.0 inclusive
    box.put("PERCENTAGE_SUMMARY_${todaysDateFormatted()}", percent);
  }

  void loadHeatMap() {
    DateTime startDate = createDateTimeObject(box.get("Start_date"));

    // count the number of days to load
    int daysInBetween = DateTime.now().difference(startDate).inDays;

    // go from start date to today and add each percentage to the dataset
    // "PERCENTAGE_SUMMARY_yyyymmdd" will be the key in the database
    for (int i = 0; i < daysInBetween + 1; i++) {
      String yyyymmdd = convertDateTimeToString(
        startDate.add(Duration(days: i)),
      );

      double strengthAsPercent = double.parse(
        box.get("PERCENTAGE_SUMMARY_$yyyymmdd") ?? "0.0",
      );

      // split the datetime up like below so it doesn't worry about hours/mins/secs etc.

      // year
      int year = startDate.add(Duration(days: i)).year;

      // month
      int month = startDate.add(Duration(days: i)).month;

      // day
      int day = startDate.add(Duration(days: i)).day;

      final percentForEachDay = <DateTime, int>{
        DateTime(year, month, day): (10 * strengthAsPercent).toInt(),
      };

      heatMapDataSet.addEntries(percentForEachDay.entries);
      print(heatMapDataSet);
    }
  }
}

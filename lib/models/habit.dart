import 'package:habit_tracker_flutter/database/database_provider.dart';

class Habit {
  int id;
  var title = "";
  var description = "";
  var priority = HabitPriority.high;
  var type = HabitType.good;
  var count = 0;
  var frequency = 0;
  var color = 0;
  var date = 0;
  var habitDoneCount = 0;
  var isComplete = false;

  Habit();

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      DatabaseProvider.COLUMN_TITLE: title,
      DatabaseProvider.COLUMN_DESCRIPTION: description,
      DatabaseProvider.COLUMN_PRIORITY: priority.index,
      DatabaseProvider.COLUMN_TYPE: type.index,
      DatabaseProvider.COLUMN_COUNT: count,
      DatabaseProvider.COLUMN_FREQUENCY: frequency,
      DatabaseProvider.COLUMN_COLOR: color,
      DatabaseProvider.COLUMN_DATE: date,
      DatabaseProvider.COLUMN_DONE_COUNT: habitDoneCount,
      DatabaseProvider.COLUMN_IS_COMPLETE: isComplete
    };

    if (id != null) {
      map[DatabaseProvider.COLUMN_ID] = id;
    }
    
    return map;
  }

  Habit.fromMap(Map<String, dynamic> map) {
    id = map[DatabaseProvider.COLUMN_ID];
    title = map[DatabaseProvider.COLUMN_TITLE];
    description = map[DatabaseProvider.COLUMN_DESCRIPTION];
    priority = HabitPriority.values[map[DatabaseProvider.COLUMN_PRIORITY]];
    type = HabitType.values[map[DatabaseProvider.COLUMN_TYPE]];
    count = map[DatabaseProvider.COLUMN_COUNT];
    frequency = map[DatabaseProvider.COLUMN_FREQUENCY];
    color = map[DatabaseProvider.COLUMN_COLOR];
    date = map[DatabaseProvider.COLUMN_DATE];
    habitDoneCount = map[DatabaseProvider.COLUMN_DONE_COUNT];
    isComplete = map[DatabaseProvider.COLUMN_IS_COMPLETE] == 1;
  }
}

enum HabitPriority { low, middle, high }

enum HabitType { bad, good }

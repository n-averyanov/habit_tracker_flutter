class Habit {
  var uid = "";
  var title = "";
  var description = "";
  var priority = HabitPriority.high;
  var type = HabitType.good;
  var count = 0;
  var frequency = 0;
  var color = 0;
  var date = 0;
  var habitDoneColor = 0;
  var isComplite = false;
}

enum HabitPriority { low, middle, high }

enum HabitType { bad, good }

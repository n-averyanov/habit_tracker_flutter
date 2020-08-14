import 'package:habit_tracker_flutter/models/habit.dart';

import 'habit_event.dart';

class AddHabit extends HabitEvent {
  final Habit habit;
  AddHabit(this.habit);
}

import 'package:habit_tracker_flutter/models/habit.dart';

import 'habit_event.dart';

class UpdateHabit extends HabitEvent {
  final Habit habit;

  UpdateHabit(this.habit);
}

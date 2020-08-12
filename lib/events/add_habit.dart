import 'package:habit_tracker_flutter/events/habit_event.dart';
import 'package:habit_tracker_flutter/models/habit.dart';

class AddHabit extends HabitEvent {
  final Habit habit;
  AddHabit(this.habit);
}

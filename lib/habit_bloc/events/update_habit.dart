import 'package:habit_tracker_flutter/habit_bloc/events/habit_event.dart';
import 'package:habit_tracker_flutter/models/habit.dart';

class UpdateHabit extends HabitEvent {
  final Habit habit;

  UpdateHabit(this.habit);
}

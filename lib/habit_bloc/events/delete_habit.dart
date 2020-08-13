import 'package:habit_tracker_flutter/habit_bloc/events/habit_event.dart';

class DeleteHabit extends HabitEvent {
  final int id;

  DeleteHabit(this.id);
}

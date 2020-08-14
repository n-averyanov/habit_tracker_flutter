import 'habit_event.dart';

class DeleteHabit extends HabitEvent {
  final int id;

  DeleteHabit(this.id);
}

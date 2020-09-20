import 'habit_event.dart';

class DeleteHabit extends HabitEvent {
  final String uid;

  DeleteHabit(this.uid);
}

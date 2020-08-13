import 'package:bloc/bloc.dart';
import 'package:habit_tracker_flutter/database/database_provider.dart';
import 'package:habit_tracker_flutter/habit_bloc/events/get_habits.dart';
import 'package:habit_tracker_flutter/models/habit.dart';

import 'events/add_habit.dart';
import 'events/habit_event.dart';

class HabitBlock extends Bloc<HabitEvent, List<Habit>> {
  HabitBlock(List<Habit> initialState) : super(initialState);

  final db = DatabaseProvider.databaseProvider;

  @override
  Stream<List<Habit>> mapEventToState(HabitEvent event) async* {
    if (event is AddHabit) {
      db.insert(event.habit);

      final data = await db.getHAbits();
      yield data;
    }
    else if (event is getHabits) {
      final data = await db.getHAbits();
      yield data;
    } else {
      throw Exception('unknow operation');
    }
  }
}

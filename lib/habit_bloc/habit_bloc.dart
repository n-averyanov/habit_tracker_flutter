import 'package:bloc/bloc.dart';
import 'package:habit_tracker_flutter/database/database_provider.dart';
import 'package:habit_tracker_flutter/habit_bloc/events/delete_habit.dart';
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
      await db.insertHabit(event.habit);
      final data = await db.getHabits();
      yield data;

    } else if (event is DeleteHabit) {
      await db.deleteHabit(event.id);
      final data = await db.getHabits();
      yield data;

    } else if (event is GetHabits) {
      final data = await db.getHabits();
      yield data;
      
    } else {
      throw Exception('unknow operation');
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:habit_tracker_flutter/models/habit.dart';

import 'events/add_habit.dart';
import 'events/habit_event.dart';


class HabitBlock extends Bloc<HabitEvent, List<Habit>> {
  HabitBlock(List<Habit> initialState) : super(initialState);

  @override
  Stream<List<Habit>> mapEventToState(HabitEvent event) async* {
    if (event is AddHabit) {
      state.add(event.habit);
      yield List.from(state);
    } else {
      throw Exception('unknow operation');
    }
  }
}

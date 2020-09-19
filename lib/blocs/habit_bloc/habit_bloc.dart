import 'package:bloc/bloc.dart';
import 'package:habit_tracker_flutter/blocs/habit_bloc/events/clear.dart';
import 'package:habit_tracker_flutter/database/database_provider.dart';
import 'package:habit_tracker_flutter/firebase/auth_service.dart';
import 'package:habit_tracker_flutter/firebase/firestore_service.dart';
import 'package:habit_tracker_flutter/models/habit.dart';

import 'events/add_habit.dart';
import 'events/delete_habit.dart';
import 'events/get_habits.dart';
import 'events/habit_event.dart';
import 'events/update_habit.dart';

class HabitBlock extends Bloc<HabitEvent, List<Habit>> {
  HabitBlock(List<Habit> initialState) : super(initialState);

  final db = DatabaseProvider.databaseProvider;
  final auth = AuthService();
  final firestore = FirestoreService();

  @override
  Stream<List<Habit>> mapEventToState(HabitEvent event) async* {
    final user = await auth.getActiveUser();

    if (event is AddHabit) {
      final habitUid = await firestore.instertHabit(event.habit, user.uid);
      await db.insertHabit(event.habit..uid = habitUid);

      final data = await db.getHabits();
      yield data;
    } else if (event is DeleteHabit) {
      await db.deleteHabit(event.uid);
      await firestore.deleteHabit(event.uid, user.uid);

      final data = await db.getHabits();
      yield data;
    } else if (event is UpdateHabit) {
      await db.updateHabit(event.habit);
      await firestore.updateHabit(event.habit, user.uid);
      final data = await db.getHabits();
      yield data;
    } else if (event is GetHabits) {
      await sync(user.uid);
      final data = await db.getHabits();
      yield data;
    } else if (event is Clear) {
      await db.clearDatabase();
      final data = await db.getHabits();
      yield data;
    } else {
      throw Exception('unknown operation');
    }
  }

  Future<void> sync(String userUid) async {
    final data = await firestore.getHabits(userUid);

    data.forEach((element) async {
      await db.insertHabit(element);
    });
  }
}

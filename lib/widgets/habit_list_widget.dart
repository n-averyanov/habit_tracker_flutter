import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/habit_bloc/habit_bloc.dart';
import 'package:habit_tracker_flutter/models/habit.dart';

import 'habit_widget.dart';

class HabitList extends StatelessWidget {
  final HabitType _type;
  HabitList(this._type);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HabitBlock, List<Habit>>(builder: (context, state) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final data =
              state.where((Habit habit) => habit.type == _type).toList();
          return Padding(
              padding: EdgeInsets.all(8), child: HabitWidget(data[index]));
        },
        itemCount: state.where((Habit habit) => habit.type == _type).length,
      );
    });
  }
}

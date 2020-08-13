import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/habit_bloc/events/delete_habit.dart';
import 'package:habit_tracker_flutter/habit_bloc/habit_bloc.dart';
import 'package:habit_tracker_flutter/models/habit.dart';

class HabitWidget extends StatelessWidget {
  final Habit habit;
  HabitWidget(this.habit);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HabitBlock>(context);

    return Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Card(
          child: Padding(
        padding: EdgeInsets.all(8),
        child: InkWell(
          onTap: () {
            Navigator.of(context).pushNamed('/habit_editor',arguments: habit);
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Center(
                child: Text(habit.title),
              ),
              Divider(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Flexible(
                      child: Text(
                    habit.description,
                    style: TextStyle(fontSize: 18),
                  )),
                  FlatButton(
                    onPressed: () {
                      bloc.add(DeleteHabit(habit.id));
                    },
                    child: Text('Delete'),
                    color: Colors.red,
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}

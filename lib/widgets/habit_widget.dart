import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/models/habit.dart';

class HabitWidget extends StatelessWidget {
  final Habit habit;
  HabitWidget(this.habit);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
      child: Card(
          child: Padding(
        padding: EdgeInsets.all(8),
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
                    child: Text(habit.description,
                        style: TextStyle(fontSize: 18),
                        )
                        ),
                FlatButton(onPressed: () {},
                 child: Text('Delete'),
                 color: Colors.red,
                 )
              ],
            )
          ],
        ),
      )),
    );
  }
}

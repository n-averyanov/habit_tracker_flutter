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
              child: Text('data'),
            ),
            Divider(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Flexible(
                    child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
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

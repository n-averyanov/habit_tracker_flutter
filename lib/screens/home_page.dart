import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/models/habit.dart';
import 'package:habit_tracker_flutter/widgets/habit_widget.dart';
import 'package:habit_tracker_flutter/widgets/settings_button.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Habits'),
        actions: [
          SettingsButton()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/habit_editor');
        },
        child: Icon(Icons.add),
      ),
      body: HabitWidget(Habit()),
    );
  }
}

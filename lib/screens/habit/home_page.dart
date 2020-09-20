import 'package:flutter/material.dart';
import 'package:habit_tracker_flutter/models/habit.dart';
import 'package:habit_tracker_flutter/widgets/habit_list_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
          length: 2,
          child: Scaffold(
        appBar: AppBar(
          title: Text('Habits'),
          bottom: TabBar(tabs: [
            Tab(child: Text('Good'),),
            Tab(child: Text('Bad'),)
          ]),
          actions: [
            IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).pushNamed('/settings');
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/habit_editor');
          },
          child: Icon(Icons.add),
        ),
        body: TabBarView(children: [
          HabitList(HabitType.good),
          HabitList(HabitType.bad)
        ])
      ),
    );
  }
}

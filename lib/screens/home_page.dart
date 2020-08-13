import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/habit_bloc/habit_bloc.dart';
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
          IconButton(icon: Icon(Icons.settings), onPressed: (){
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
      body: BlocBuilder<HabitBlock, List<Habit>>(builder: (context, state) {
        return ListView.builder(itemBuilder: (context, index) {
          if (state.isEmpty) {
            return null;
          }
          return HabitWidget(state[index]);
        },
        itemCount: state.length,);
      }),
    );
  }
}

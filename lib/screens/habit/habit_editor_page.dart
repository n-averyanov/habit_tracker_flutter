import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habit_tracker_flutter/blocs/habit_bloc/events/add_habit.dart';
import 'package:habit_tracker_flutter/blocs/habit_bloc/events/update_habit.dart';
import 'package:habit_tracker_flutter/blocs/habit_bloc/habit_bloc.dart';
import 'package:habit_tracker_flutter/models/habit.dart';

class HabitEditorPage extends StatefulWidget {
  @override
  _HabitEditorPageState createState() => _HabitEditorPageState();
}

class _HabitEditorPageState extends State<HabitEditorPage> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _countController = TextEditingController();

  Habit _habit;
  bool _isNew;

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      _habit.title = _titleController.text;
    });

    _descriptionController.addListener(() {
      _habit.description = _descriptionController.text;
    });

    _countController.addListener(() {
      _habit.count = int.parse(_countController.text);
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _countController.dispose();
    super.dispose();
  }

  void fillTextBoxes() {
    _titleController.text = _habit.title;
    _descriptionController.text = _habit.description;
    _countController.text = _habit.count.toString();
  }

  @override
  Widget build(BuildContext context) {
    final habitBloc = BlocProvider.of<HabitBlock>(context);

    if (_habit == null) {
      final habit = ModalRoute.of(context).settings.arguments;
      _isNew = habit == null;
      _habit = habit ?? Habit();
    }

    fillTextBoxes();

    return Scaffold(
      appBar: AppBar(
        title: Text('Editor'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Habit title'),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              DropdownButton(
                isExpanded: true,
                value: _habit.priority,
                icon: Icon(Icons.arrow_drop_down),
                onChanged: (HabitPriority newValue) {
                  setState(() {
                    _habit.priority = newValue;
                  });
                },
                items: HabitPriority.values
                    .map<DropdownMenuItem<HabitPriority>>(
                        (HabitPriority value) {
                  return DropdownMenuItem<HabitPriority>(
                    value: value,
                    child: Text(describeEnum(value)),
                  );
                }).toList(),
              ),
              ListTile(
                title: const Text('Good'),
                leading: Radio(
                  value: HabitType.good,
                  groupValue: _habit.type,
                  onChanged: (HabitType value) {
                    setState(() {
                      _habit.type = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Bad'),
                leading: Radio(
                  value: HabitType.bad,
                  groupValue: _habit.type,
                  onChanged: (HabitType value) {
                    setState(() {
                      _habit.type = value;
                    });
                  },
                ),
              ),
              Text('Repeat'),
              TextField(
                controller: _countController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Times'),
              ),
              SizedBox(
                height: 8,
              ),
              Text('per'),
              DropdownButton(
                  isExpanded: true,
                  value: _habit.frequency,
                  items: HabitFrequency.values
                      .map<DropdownMenuItem<HabitFrequency>>(
                          (HabitFrequency item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(describeEnum(item)),
                    );
                  }).toList(),
                  onChanged: (HabitFrequency newValue) {
                    setState(() {
                      _habit.frequency = newValue;
                    });
                  })
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            if (_isNew) {
              habitBloc.add(AddHabit(_habit));
            } else {
              habitBloc.add(UpdateHabit(_habit));
            }
            Navigator.of(context).pop();
          },
          label: Text('Save')),
    );
  }
}

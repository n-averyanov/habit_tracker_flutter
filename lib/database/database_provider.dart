import 'package:habit_tracker_flutter/models/habit.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  static const String TABLE_HABIT = 'habit';
  static const String COLUMN_UID = 'uid';
  static const String COLUMN_TITLE = 'title';
  static const String COLUMN_DESCRIPTION = 'description';
  static const String COLUMN_PRIORITY = 'priority';
  static const String COLUMN_TYPE = 'type';
  static const String COLUMN_COUNT = 'count';
  static const String COLUMN_FREQUENCY = 'frequency';
  static const String COLUMN_COLOR = 'color';
  static const String COLUMN_DATE = 'date';
  static const String COLUMN_DONE_COUNT = 'done_count';
  static const String COLUMN_IS_COMPLETE = 'is_complete';

  DatabaseProvider._();

  static final DatabaseProvider databaseProvider = DatabaseProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await _createDatabase();

    return _database;
  }

  Future<Database> _createDatabase() async {
    String dbPath = await getDatabasesPath();

    return await openDatabase(join(dbPath, 'habit_database.db'), version: 3,
        onCreate: (db, versinon) async {
      await db.execute("CREATE TABLE $TABLE_HABIT ("
          "$COLUMN_UID TEXT PRIMARY KEY,"
          "$COLUMN_TITLE TEXT,"
          "$COLUMN_DESCRIPTION TEXT,"
          "$COLUMN_PRIORITY INTEGER,"
          "$COLUMN_TYPE INTEGER,"
          "$COLUMN_COUNT INTEGER,"
          "$COLUMN_FREQUENCY INTEGER,"
          "$COLUMN_COLOR INTEGER,"
          "$COLUMN_DATE INTEGER,"
          "$COLUMN_DONE_COUNT INTEGER,"
          "$COLUMN_IS_COMPLETE INTEGER"
          ")");
    });
  }

  Future<List<Habit>> getHabits() async {
    final db = await database;

    var habits = await db.query(TABLE_HABIT, columns: [
      COLUMN_UID,
      COLUMN_TITLE,
      COLUMN_DESCRIPTION,
      COLUMN_PRIORITY,
      COLUMN_TYPE,
      COLUMN_COUNT,
      COLUMN_FREQUENCY,
      COLUMN_COLOR,
      COLUMN_DATE,
      COLUMN_DONE_COUNT,
      COLUMN_IS_COMPLETE
    ]);

    var habitList = habits.map((habit) => Habit.fromMap(habit)).toList();

    return habitList;
  }

  Future<void> insertHabit(Habit habit) async {
    final db = await database;

    db.insert(TABLE_HABIT, habit.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteHabit(String uid) async {
    final db = await database;

    db.delete(TABLE_HABIT, where: "uid = ?", whereArgs: [uid]);
  }

  Future<void> updateHabit(Habit habit) async {
    final db = await database;

    db.update(TABLE_HABIT, habit.toMap(),
        where: "uid = ?", whereArgs: [habit.uid]);
  }

  Future<void> clearDatabase() async {
    final db = await database;

    db.delete(TABLE_HABIT);
  }
}

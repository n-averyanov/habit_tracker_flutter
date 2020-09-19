import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:habit_tracker_flutter/models/habit.dart';

class FirestoreService {
  final _firestore = Firestore.instance;

  Future<String> instertHabit(Habit habit, String userUid) async {
    final doc = await _firestore.collection(userUid).document();

    doc.setData(habit.toMap());

    return doc.documentID;
  }

  Future<void> updateHabit(Habit habit, String userUid) async {
    await _firestore
        .collection(userUid)
        .document(habit.uid)
        .updateData(habit.toMap());
  }

  Future<void> deleteHabit(String habitUid, String userUid) async {
    await _firestore.collection(userUid).document(habitUid).delete();
  }

  Future<List<Habit>> getHabits(String userUid) async {
    var docs = await _firestore.collection(userUid).getDocuments();

    
    List<Habit> habits = docs.documents.map((e) => Habit.fromMap(e.data)).toList();
    
    return habits;
  }
}

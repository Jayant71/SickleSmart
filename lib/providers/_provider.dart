import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sicklesmart/models/firestoremodel.dart';

import '../models/authmodel.dart';

part '_provider.g.dart';

final testsList = [
  'Solubility Test (Tube Method)',
  'Sickling Test (Slide Method)',
  'Electrophoresis'
];

final db = FirebaseFirestore.instance;
final currentUser = Authentication().currentUser;
List<Map<String, dynamic>> tests = [];
List<Map<String, dynamic>> medications = [];

final authenticationProvider = Provider<Authentication>((ref) {
  return Authentication();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return ref.watch(authenticationProvider).authStateChange;
});

final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authenticationProvider).currentUser;
});

final databaseProvider = Provider<FireStore>((ref) {
  return FireStore();
});

final databaseInstanceProvider = Provider<FirebaseFirestore>((ref) {
  return FireStore().db;
});

final testListProvider = Provider<List>((ref) => testsList);

@riverpod
class Medication extends _$Medication {
  @override
  List build() {
    return medications;
  }

  Future<void> getMedications() async {
    if (medications.isNotEmpty) return;
    await db
        .collection('users')
        .doc(currentUser!.uid)
        .collection('Medications')
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        medications.add(doc.data());
      }
      state = [...medications];
    });
  }

  Future<void> addMedication(medication) async {
    state = [...state, medication];
    await db
        .collection('users')
        .doc(currentUser!.uid)
        .collection('Medications')
        .doc('${DateTime.now()}')
        .set(medication);
  }
}

@riverpod
class Test extends _$Test {
  @override
  List build() {
    return tests;
  }

  Future<void> getTests() async {
    if (tests.isNotEmpty) return;
    await db
        .collection('users')
        .doc(currentUser!.uid)
        .collection('Tests')
        .get()
        .then((querySnapshot) {
      for (var doc in querySnapshot.docs) {
        tests.add(doc.data());
      }
    });
    state = [...tests];
  }

  Future<void> addTest(test) async {
    state = [...state, test];
    await db
        .collection('users')
        .doc(currentUser!.uid)
        .collection('Tests')
        .doc('${DateTime.now()}')
        .set(test);
  }
}

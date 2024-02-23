import 'package:cloud_firestore/cloud_firestore.dart';

class FireStore {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<dynamic> addData(
      Map<String, dynamic> data, String collectionName) async {
    data['createdAt'] = FieldValue.serverTimestamp();
    try {
      return await db.collection(collectionName).add(data);
    } catch (e) {}
  }

  Future<dynamic> addDataWithId(
      Map<String, dynamic> data, String collectionName, String docId) async {
    data['createdAt'] = FieldValue.serverTimestamp();
    try {
      return await db
          .collection(collectionName)
          .doc(docId)
          .set(data, SetOptions(merge: true));
    } catch (e) {}
  }

  Future<void> updateData(
      Map<String, dynamic> data, String collectionName, String docId) async {
    data['lastupdatedAt'] = FieldValue.serverTimestamp();
    try {
      await db.collection(collectionName).doc(docId).update(data);
    } catch (e) {}
  }

  Future<void> deleteData(String collectionName, String docId) async {
    try {
      await db.collection(collectionName).doc(docId).delete();
    } catch (e) {}
  }

  Future<dynamic> getData(String collectionName) async {
    try {
      return await db.collection(collectionName).get();
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> getDocData(String collectionName, String docId) async {
    try {
      return await db.collection(collectionName).doc(docId).get();
    } catch (e) {
      return e;
    }
  }

  Future<dynamic> getDocDataByField(
      String collectionName, String fieldName, String fieldValue) async {
    try {
      return await db
          .collection(collectionName)
          .where(fieldName, isEqualTo: fieldValue)
          .get();
    } catch (e) {
      return e;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseClient {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> post(String path, {dynamic data, String? docName}) async {
    try {
      var randomId = '';
      await _firebaseFirestore.collection(path).doc(docName ?? randomId).set(data);
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> getDoc(String path, {required String docId}) async {
    try {
      var response = await _firebaseFirestore.collection(path).doc(docId).get();
      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> deleteDoc(String path, {required String docId}) async {
    try {
      await _firebaseFirestore.collection(path).doc(docId).delete();
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> updateDoc(String path, {required Map<String, dynamic> data, required String docName}) async {
    try {
      await _firebaseFirestore.collection(path).doc(docName).update(data);
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getSnapshots(String path) {
    try {
      var collectionDocs = _firebaseFirestore.collection(path).snapshots();
      return collectionDocs;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
  
}

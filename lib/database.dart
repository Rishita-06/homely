// TODO Implement this library.
// database.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final CollectionReference requests =
      FirebaseFirestore.instance.collection('requests'); // Firestore collection


Stream<QuerySnapshot> getRequests() {
    try {
      return requests.snapshots();
    } catch (e) {
      print('Error getting requests: $e');
      return Stream.empty();
    }
  }

  // Method to accept the request
  Future<void> acceptRequest(String documentId) async {
    try {
      await requests.doc(documentId).update({'status': 'accepted'});
    } catch (e) {
      print('Error accepting request: $e');
    }
  }

  // Method to reject the request
  Future<void> rejectRequest(String documentId) async {
    try {
      await requests.doc(documentId).update({'status': 'rejected'});
    } catch (e) {
      print('Error rejecting request: $e');
    }
  }

  // Method to get a stream of requests from Firebase


}

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot> fetchScannedData() {
    return _firestore.collection('scanned_data').orderBy('timestamp').snapshots();
  }
}

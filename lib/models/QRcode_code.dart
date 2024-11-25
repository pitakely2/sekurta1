import 'package:cloud_firestore/cloud_firestore.dart';

class QRCodeViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveScannedData(String scannedData) async {
    try {
      await _firestore.collection('scanned_data').add({
        'data': scannedData,
        'timestamp': DateTime.now(),
      });
    } catch (e) {
      print("Erreur d'enregistrement : $e");
    }
  }
}

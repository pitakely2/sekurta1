import 'package:flutter/material.dart';

class HomeViewModel extends ChangeNotifier {
  String instructions = 'Consignes non chargées.';

  void loadInstructions() {
    // Simule un chargement distant
    instructions = '1. Vérifiez vos informations après le scan.\n'
        '2. Suivez les étapes de paiement.\n'
        '3. Assurez-vous de terminer toutes les étapes.';
    notifyListeners();
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sekurta/viewmodels/acceuil_viewmodel.dart';

class HomePage extends StatelessWidget {
  get Provider => null;

  @override
  Widget build(BuildContext context) {
    final homeViewModel = Provider.of<HomeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Accueil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Merci d\'avoir scanné votre QR Code !',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              homeViewModel.instructions,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/payment');
              },
              child: Text('Passer au paiement'),
            ),
          ],
        ),
      ),
    );
  }
}


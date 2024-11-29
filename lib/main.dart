import 'package:flutter/material.dart';
import "package:provider/provider.dart";
import 'package:sekurta/viewmodels/login_viewmodel.dart';
import 'package:sekurta/viewmodels/qrcode_viewmodel.dart';
import 'package:sekurta/viewmodels/acceuil_viewmodel.dart';
import 'models/QRcode_code.dart';
import 'view/acceuil_page.dart';
import 'view/login_page.dart';
import 'view/qr_scanner_page.dart';
import 'view/scanne_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}


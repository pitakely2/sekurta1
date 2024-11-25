import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:provider/provider.dart';
import 'qrcode_viewmodel.dart';

class QRCodeScanPage extends StatefulWidget {
  @override
  _QRCodeScanPageState createState() => _QRCodeScanPageState();
}

class _QRCodeScanPageState extends State<QRCodeScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    final qrCodeViewModel = Provider.of<QRCodeViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Scanner un QR Code')),
      body: QRView(
        key: qrKey,
        onQRViewCreated: (controller) {
          this.controller = controller;
          controller.scannedDataStream.listen((scanData) async {
            await qrCodeViewModel.saveScannedData(scanData.code);
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text('Données enregistrées : ${scanData.code}'),
            ));
            Navigator.pushNamed(context, '/home');
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/arrow_navigation_container.dart';
import 'package:mhgap_urdu/utils/texts.dart';
import 'package:pdfx/pdfx.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  _PdfScreenState createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  late PdfControllerPinch _pdfController;

  @override
  void initState() {
    super.initState();
    _pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/files/full.pdf'),
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  Future<void> downloadPdf() async {
    final status = await Permission.storage.request();

    if (status.isGranted) {
      final dir = await getExternalStorageDirectory();
      final filePath = '${dir?.path}/full.pdf';
      
      // Copy the file from the asset folder to the external storage directory
      final data = await DefaultAssetBundle.of(context).load('assets/files/full.pdf');
      final bytes = data.buffer.asUint8List();
      final file = File(filePath);
      await file.writeAsBytes(bytes);

      // Notify the user of download completion
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('PDF downloaded to $filePath')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Storage permission denied')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body: Column(
        children: <Widget>[
          const ArrowNavigationContainer(
            text: FurtherInformation.screenTitle,
            showBackButton: true,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ElevatedButton.icon(
              onPressed: downloadPdf, // Download PDF when pressed
              icon: const Icon(Icons.download),
              label: const Text('Download PDF'),
            ),
          ),
          Expanded(
            child: PdfViewPinch(
              controller: _pdfController,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/arrow_navigation_container.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:mhgap_urdu/utils/texts.dart';
import 'package:pdfx/pdfx.dart';

class EmergencyDiagnosisScreen extends StatefulWidget {
  const EmergencyDiagnosisScreen({super.key});

  @override
  _EmergencyDiagnosisScreenState createState() =>
      _EmergencyDiagnosisScreenState();
}

class _EmergencyDiagnosisScreenState extends State<EmergencyDiagnosisScreen> {
  late PdfControllerPinch _pdfController;

  @override
  void initState() {
    super.initState();
    _pdfController = PdfControllerPinch(
      document: PdfDocument.openAsset('assets/files/output_long_page.pdf'),
    );
    print(_pdfController);
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body: Column(
        children: <Widget>[
          const ArrowNavigationContainer(
            text: EmergencyDiagnosisText.navigationText,
            showBackButton: true,
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

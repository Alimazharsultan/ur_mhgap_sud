import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/arrow_navigation_container.dart';
// import 'package:mhgap_urdu/components/base_scaffold.dart';
// import 'package:mhgap_urdu/components/bullet_points.dart';
// import 'package:mhgap_urdu/components/octagonal_container.dart';
// import 'package:mhgap_urdu/components/text_components.dart';
// import 'package:mhgap_urdu/utils/colors.dart';
import 'package:mhgap_urdu/utils/texts.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

class EmergencyDiagnosisScreen extends StatefulWidget {
  const EmergencyDiagnosisScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmergencyDiagnosisScreenState createState() =>
      _EmergencyDiagnosisScreenState();
}

class _EmergencyDiagnosisScreenState extends State<EmergencyDiagnosisScreen> {
  String? pdfPath;

  @override
  void initState() {
    super.initState();
    loadPdfFromAssets();
  }

  Future<void> loadPdfFromAssets() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/output_long_page.pdf');
      if (!await file.exists()) {
        final data = await rootBundle.load('assets/files/output_long_page.pdf');
        final bytes = data.buffer.asUint8List();
        await file.writeAsBytes(bytes, flush: true);
      }
      setState(() {
        pdfPath = file.path;
      });
    } catch (e) {
      print("Error loading PDF: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body: Stack(
        children: <Widget>[
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: ArrowNavigationContainer(
                text: EmergencyDiagnosisText.navigationText,
                showBackButton: true),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: pdfPath != null
                        ? SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height *
                                6, // Set an explicit height
                            child: PDFView(
                              filePath: pdfPath!,
                            ),
                          )
                        : const Center(child: CircularProgressIndicator()),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

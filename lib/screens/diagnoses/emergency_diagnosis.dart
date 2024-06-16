import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/octagonal_container.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:io';

class EmergencyDiagnosisScreen extends StatefulWidget {
  const EmergencyDiagnosisScreen({super.key});

  @override
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
      final file = File('${dir.path}/chart.pdf');
      if (!await file.exists()) {
        final data = await rootBundle.load('assets/files/chart.pdf');
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
    double screenWidth = MediaQuery.of(context).size.width;
    return BaseScaffold(
      title: EmergencyDiagnosisText.navigationText,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const EmergencyTitleText(
                redText: EmergencyDiagnosisText.titleRed,
                orangeText: EmergencyDiagnosisText.titleOrange),
            const SizedBox(height: 20),
            const CustomPaint(
              size: Size(320, 80), // Adjust size to fit your needs
              painter: OctagonalBadgePainter(
                  text: EmergencyDiagnosisText.octagonalText),
            ),
            const SizedBox(height: 30),
            ...EmergencyDiagnosisText.emergencyBulletPoints
                .asMap()
                .entries
                .map((entry) {
              String boldText = entry.value["boldText"] as String;
              String normalText = entry.value["normalText"] as String;
              return EmergencyBulletPoints(
                  boldText: boldText, normalText: normalText);
            }),
            const SizedBox(height: 10),
            Align(
              alignment: AlignmentDirectional.center,
              child: pdfPath != null
                  ? SizedBox(
                      width: screenWidth-5,
                      height: 6800, // Adjust height as needed
                      child: PDFView(
                        filePath: pdfPath!,
                      ),
                    )
                  : Center(child: CircularProgressIndicator()),
            ),
          ],
        ),
      ),
    );
  }
}

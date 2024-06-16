import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/arrow_navigation_container.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/octagonal_container.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/colors.dart';
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
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    double screenWidth = MediaQuery.of(context).size.width;
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
                  InteractiveViewer(
                      panEnabled: true, // Enables panning
                      minScale: 0.5, // Minimum scale factor for zoom-out
                      maxScale: 4.0, // Maximum scale factor for zoom-in
                      child: Column(
                        children: [
                          const EmergencyTitleText(
                              redText: EmergencyDiagnosisText.titleRed,
                              orangeText: EmergencyDiagnosisText.titleOrange),
                          const SizedBox(height: 20),
                          const CustomPaint(
                            size:
                                Size(320, 80), // Adjust size to fit your needs
                            painter: OctagonalBadgePainter(
                                text: EmergencyDiagnosisText.octagonalText),
                          ),
                          const SizedBox(height: 30),
                          ...EmergencyDiagnosisText.emergencyBulletPoints
                              .asMap()
                              .entries
                              .map((entry) {
                            String boldText = entry.value["boldText"] as String;
                            String normalText =
                                entry.value["normalText"] as String;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 60),
                              child: RichText(
                                textAlign: TextAlign.justify,
                                textDirection: TextDirection.rtl,
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    const TextSpan(
                                      text: '\u00BB ',
                                      style: TextStyle(
                                        color: navigationBarColor,
                                        fontSize: 24,
                                        fontFamily: "Jameel",
                                        height: 1.0,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    TextSpan(
                                      text: boldText,
                                      style: const TextStyle(
                                        color: bodyTextColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Nastaliq",
                                        height: 3,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    TextSpan(
                                      text: normalText,
                                      style: const TextStyle(
                                        color: bodyTextColor,
                                        fontSize: 13,
                                        fontFamily: "Nataliq",
                                        fontWeight: FontWeight.w400,
                                        height: 3,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      )),
                  const SizedBox(height: 10),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: pdfPath != null
                        ? SizedBox(
                            width: screenWidth - 5,
                            height: 5000,
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

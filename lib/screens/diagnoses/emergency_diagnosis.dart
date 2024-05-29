import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/octagonal_container.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

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
    // loadPdfFromAssets();
  }

  @override
  Widget build(BuildContext context) {
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
              size: Size(320, 90), // Adjust size to fit your needs
              painter: OctagonalBadgePainter(
                  text: EmergencyDiagnosisText.octagonalText),
            ),
            const SizedBox(height: 20),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InteractiveViewer(
                panEnabled: true, // Enables panning
                minScale: 0.5, // Minimum scale factor for zoom-out
                maxScale: 4.0, // Maximum scale factor for zoom-in
                child: Image(
                  image: ResizeImage(
                    AssetImage('assets/images/chart_page-0001.jpg'),
                    width:
                        800, // Adjust the width and height according to your needs
                    height: 16000,
                  ),
                  fit: BoxFit.fill,
                ),
              ),
            )
            // const ImageComponent(
            //   imagePath: 'assets/images/chart_page-0001.jpg',
            //   width: 400,
            //   height: 550,
            // ),
            // const Padding(
            //     padding: EdgeInsets.only(left: 25),
            //     child: ImageComponent(
            //       imagePath: 'assets/images/chart_page-0002.jpg',
            //       width: 360,
            //       height: 550,
            //     )),
            // const Padding(
            //     padding: const EdgeInsets.only(left: 28),
            //     child: ImageComponent(
            //       imagePath: 'assets/images/chart_page-0003.jpg',
            //       width: 360,
            //       height: 550,
            //     )),
            // const Padding(
            //     padding: EdgeInsets.only(left: 41),
            //     child: ImageComponent(
            //       imagePath: 'assets/images/chart_page-0004.jpg',
            //       width: 360,
            //       height: 550,
            //     )),
            // const Padding(
            //     padding: EdgeInsets.only(left: 70),
            //     child: ImageComponent(
            //       imagePath: 'assets/images/chart_page-0005.jpg',
            //       width: 360,
            //       height: 550,
            //     )),
            // const Padding(
            //     padding: EdgeInsets.only(left: 25),
            //     child: ImageComponent(
            //       imagePath: 'assets/images/chart_page-0006.jpg',
            //       width: 360,
            //       height: 550,
            //     )),
            // pdfPath != null
            //     ? Container(
            //         height: 400, // Adjust height as needed
            //         child: PDFView(
            //           filePath: pdfPath!,
            //         ),
            //       )
            //     : CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

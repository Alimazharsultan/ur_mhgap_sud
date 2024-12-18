import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/octagonal_container.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/diagnoses/emergency_diagnosis.dart';
import 'package:mhgap_urdu/utils/texts.dart';

import '../../utils/colors.dart';

class EmergencyDiagnosisScreen extends StatefulWidget {
  const EmergencyDiagnosisScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _EmergencyDiagnosisScreenState createState() =>
      _EmergencyDiagnosisScreenState();
}

class _EmergencyDiagnosisScreenState extends State<EmergencyDiagnosisScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  navigateWithSlideTransition(
                      context, const EmergencyDiagnosisScreenPdf() as Widget);
                },
                child: const BaseTextComponent(
                    text: EmergencyDiagnosisText.nextScreenText, color: headingColor),
              ),
            ),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

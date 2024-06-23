import 'package:flutter/material.dart';

import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/components/yes_no_buttons.dart';
import 'package:mhgap_urdu/screens/administrative/protocol1_administrative.dart';
import 'package:mhgap_urdu/screens/administrative/protocol2/protocol2_administrative.dart';
import 'package:mhgap_urdu/screens/diagnoses/simple_diagnose_diagnosis.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class ThreeStageDiagnosisScreen extends StatelessWidget {
  const ThreeStageDiagnosisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: DiagnosisScreen.navigationText,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const TitleText(
                    text: ThirdStageDiagnosisScreenTexts.title, addHorizontalPadding: true),
                const SubTitleText(
                    text: ThirdStageDiagnosisScreenTexts.subTitle,
                    center: true),
                const SubHeadingText(
                    text: ThirdStageDiagnosisScreenTexts.subHeading1,
                    addHorizontalPadding: true),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: ThirdStageDiagnosisScreenTexts.bulletPointsList1
                        .asMap()
                        .entries
                        .map((entry) {
                      String text = entry
                          .value; // Assuming this is a correct representation of your data structure.
                      return DescriptionText(normalText: text, showBullet: true);
                    }).toList(), // Convert the Iterable to a List.
                  ),
                ),
                const SubTitleText(
                    text: ThirdStageDiagnosisScreenTexts.subHeading2,
                    underline: true,
                    addPadding: true),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: ThirdStageDiagnosisScreenTexts.bulletPointsList2
                        .asMap()
                        .entries
                        .map((entry) {
                      String text = entry
                          .value["normalText"] as String;
                      String heading = entry.value["boldText"] as String; // Assuming this is a correct representation of your data structure.
                      return DescriptionText(boldText: heading, normalText: text, showBullet: true);
                    }).toList(), // Convert the Iterable to a List.
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
          YesNoButtons(
            onYesPressed: () {
              navigateWithSlideTransition(
                context,
                const SimpleDiagnoseScreen(
                    text: ThirdStageDiagnosisScreenTexts.diagnoseAdvice1,
                    screen: Protocol1AdministrativeSreen()),
              );
            },
            onNoPressed: () {
              navigateWithSlideTransition(
                context,
                const SimpleDiagnoseScreen(
                    text: ThirdStageDiagnosisScreenTexts.diagnoseAdvice2,
                    screen: Protocol2AdministrativeSreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}

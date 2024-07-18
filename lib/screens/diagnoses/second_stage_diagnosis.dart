import 'package:flutter/material.dart';

import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/components/yes_no_buttons.dart';
import 'package:mhgap_urdu/screens/diagnoses/third_stage_diagnosis.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class SecondStageDiagnosisScreen extends StatelessWidget {
  const SecondStageDiagnosisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: DiagnosisScreen.title,
        body: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const TitleText(
                    text: SecondStageDiagnosisScreenTexts.title, addHorizontalPadding: true,
                    ),
                const SubTitleText(
                    text: SecondStageDiagnosisScreenTexts.subitle1,
                    center: true),
                const SubHeadingText(
                  text: SecondStageDiagnosisScreenTexts.subitle2, addHorizontalPadding: true,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 10),
                      const NumberPoint(
                          text: SecondStageDiagnosisScreenTexts.numberPoint1,
                          numberString: ' .ا'),
                      // const DescriptionText(normalText: SecondStageDiagnosisScreenTexts.number1Questions),
                      const SizedBox(height: 10),
                      const NumberPoint(
                          text: SecondStageDiagnosisScreenTexts.numberPoint2,
                          numberString: ' .ب'),
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: SecondStageDiagnosisScreenTexts
                              .bulletPointsList
                              .asMap()
                              .entries
                              .map((entry) {
                            String text = entry
                                .value; // Assuming this is a correct representation of your data structure.
                            return BulletPoint(text: text);
                          }).toList(), // Convert the Iterable to a List.
                        ),
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ],
            ),
          ),
          YesNoButtons(
            onYesPressed: () {
              navigateWithSlideTransition(
                  context, const ThreeStageDiagnosisScreen());
            },
            onNoPressed: () {
              navigateWithSlideTransition(
                  context, const ThreeStageDiagnosisScreen());
            },
          )
        ]));
  }
}

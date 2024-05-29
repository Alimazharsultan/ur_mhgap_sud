import 'package:flutter/material.dart';

import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/components/yes_no_buttons.dart';
import 'package:mhgap_urdu/screens/diagnoses/psychoactive_diagnosis.dart';
import 'package:mhgap_urdu/screens/diagnoses/simple_diagnose_diagnosis.dart';
import 'package:mhgap_urdu/screens/diagnoses/second_stage_diagnosis.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class FirstStageDiagnosisScreen extends StatelessWidget {
  const FirstStageDiagnosisScreen({super.key});

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
                    text: FirstStageDiagnosisScreenTexts.title,
                    addHorizontalPadding: true,
                    ),
                const SubTitleText(
                    text: FirstStageDiagnosisScreenTexts.subTitle1,
                    center: true),
                ...FirstStageDiagnosisScreenTexts.bulletPoints1
                    .map((text) => BulletPoint(text: text)),
                const SubTitleText(
                    text: FirstStageDiagnosisScreenTexts.subTitle2,
                    center: true),
                ...FirstStageDiagnosisScreenTexts.bulletPoints2
                    .map((text) => BulletPoint(text: text)),
                const SizedBox(height: 80),
              ],
            ),
          ),
          YesNoButtons(
            onYesPressed: () {
              navigateWithSlideTransition(
                  context, const SecondStageDiagnosisScreen());
            },
            onNoPressed: () {
              navigateWithSlideTransition(
                  context,
                  const SimpleDiagnoseScreen(
                      text: FirstStageDiagnosisScreenTexts.diagnoseAdvice1,
                      screen: SimpleDiagnoseScreen(
                          text: FirstStageDiagnosisScreenTexts.diagnoseAdvice2,
                          screen: PsychoactiveDiagnoseScreen())));
            },
          )
        ],
      ),
    );
  }
}

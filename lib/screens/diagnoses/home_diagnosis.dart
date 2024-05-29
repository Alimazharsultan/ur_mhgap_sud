import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/divider_components.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/screens/diagnoses/appearance_diagnosis.dart';
import 'package:mhgap_urdu/screens/diagnoses/emergency_diagnosis.dart';
import 'package:mhgap_urdu/screens/diagnoses/psychoactive_diagnosis.dart';
import 'package:mhgap_urdu/screens/diagnoses/first_stage_diagnosis.dart';
import 'package:mhgap_urdu/screens/diagnoses/second_stage_diagnosis.dart';
import 'package:mhgap_urdu/screens/diagnoses/third_stage_diagnosis.dart';
import 'package:mhgap_urdu/utils/colors.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class DiagnosisHomeScreen extends StatelessWidget {
  const DiagnosisHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: HomeScreenTexts.navigationText,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Column(
              children: <Widget>[
                const TitleText(text: DiagnosisScreen.navigationText),
                NavigationRow(
                    title: EmergencyDiagnosisText.navigationBarText,
                    showBottomBar: false,
                    // screen: EmergencyDiagnosisScreen(),
                    onPressed: () => {
                          navigateWithSlideTransition(
                              context, const EmergencyDiagnosisScreen())
                        },
                    ),
                const ListBulletPoints(
                    bulletPoints: EmergencyDiagnosisText.bulletPoints, isRedText: false, addHorizontalPadding: true),
                const DividerLine(),
                NavigationRow(
                  title: AppearanceDiagnosisText.title,
                  onPressed: () => navigateWithSlideTransition(
                    context,
                    const AppearanceDiagnosisScreen(),
                  ),
                ),
                NavigationRow(
                    title: PsychoactiveDiagnoseText.title,
                    onPressed: () => {
                          navigateWithSlideTransition(
                              context, const PsychoactiveDiagnoseScreen()),
                        }),
                NavigationRow(
                  title: FirstStageDiagnosisScreenTexts.title,
                  onPressed: () {
                    navigateWithSlideTransition(
                        context, const FirstStageDiagnosisScreen());
                  },
                ),
                NavigationRow(
                  title: SecondStageDiagnosisScreenTexts.title,
                  onPressed: () {
                    navigateWithSlideTransition(
                        context, const SecondStageDiagnosisScreen());
                  },
                ),
                NavigationRow(
                  title: ThirdStageDiagnosisScreenTexts.title,
                  onPressed: () {
                    navigateWithSlideTransition(
                        context, const ThreeStageDiagnosisScreen());
                  },
                ),

                // Container(color: Colors.orange, height: 2)
              ],
            ),
          ),
        ));
  }
}

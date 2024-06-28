import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/components/next_button.dart';
import 'package:mhgap_urdu/screens/diagnoses/psychoactive_diagnosis.dart';
import 'package:mhgap_urdu/utils/texts.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';

class AppearanceDiagnosisScreen extends StatelessWidget {
  const AppearanceDiagnosisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: DiagnosisScreen.navigationText,
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            padding: const EdgeInsets.only(
                bottom: 100.0), // Add padding to avoid overlap with the button
            child: Column(
              children: <Widget>[
                const TitleText(
                  text: AppearanceDiagnosisText.title,
                  addHorizontalPadding: true
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...AppearanceDiagnosisText.bullet_points
                          .map<Widget>((point) {
                        List<Widget> subBulletPoints = [];
                        if (point.containsKey("sub_bullet_points")) {
                          subBulletPoints =
                              (point["sub_bullet_points"] as List<String>)
                                  .map((subPoint) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 35.0),
                                        child: DescriptionText(
                                          normalText: "- $subPoint",
                                        ),
                                      ))
                                  .toList();
                        }

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Column(  
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BulletPoint(
                                  text: point["text"] as String,
                                  horizontalPadding: 10, topMargin: 15,),
                              ...subBulletPoints,
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const NextButton(screen: PsychoactiveDiagnoseScreen()),
        ],
      ),
    );
  }
}

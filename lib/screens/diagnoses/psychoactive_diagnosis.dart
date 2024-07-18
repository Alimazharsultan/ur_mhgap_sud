import 'package:flutter/material.dart';

import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/divider_components.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/next_button.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/diagnoses/first_stage_diagnosis.dart';
import 'package:mhgap_urdu/screens/diagnoses/three_buttons_diagnosis.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class PsychoactiveDiagnoseScreen extends StatelessWidget {
  const PsychoactiveDiagnoseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: DiagnosisScreen.title,
        body: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  const TitleText(
                    text: PsychoactiveDiagnoseText.title,
                    showDividerLine: false,
                  ),
                  const SubTitleText(
                    text: PsychoactiveDiagnoseText.subTitle,
                    // fontSize: 18,
                    center: true,
                    addPadding: true,
                  ),
                  const HeadingDividerLine(),
                  const SizedBox(height: 10),
                  ...PsychoactiveDiagnoseText.listPsychoactivItems.map((item) {
                    return NavigationRow(
                      title: item['title'],
                      onPressed: () {
                        navigateWithSlideTransition(
                            context,
                            ThreeButtonDiagnoseScreen(
                              title: item['title'],
                              buttons: item['buttons'],
                            ));
                      },
                    );
                  }),
                  const SizedBox(height: 80)
                ],
              ),
            ),
          ),
          const NextButton(screen: FirstStageDiagnosisScreen()),
        ]));
  }
}

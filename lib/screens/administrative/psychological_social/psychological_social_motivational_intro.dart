import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class PsychologicalSocialMotivationalIntroScreen extends StatelessWidget {
  const PsychologicalSocialMotivationalIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TitleText(
                text:
                    PsychologicalSocialMotivationalScreenTexts.navigationTitle,
                addHorizontalPadding: true,
              ),
              SubTitleText(
                text:
                    PsychologicalSocialMotivationalScreenTexts.introScreenTitle,
                center: true,
              ),
              ListBulletPoints(
                  bulletPoints: PsychologicalSocialMotivationalScreenTexts
                      .introBulletPoints,
                  addHorizontalPadding: true),
              SizedBox(height: 20),
            ],
          ),
        ));
  }
}

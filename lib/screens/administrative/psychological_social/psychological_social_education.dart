import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class PsychologicalSocialEducationScreen extends StatelessWidget {
  const PsychologicalSocialEducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TitleText(
                text: PsychologicalSocialScreenTexts.title,
                addHorizontalPadding: true,
              ),
              SubTitleText(
                text: PsychologicalSocialEducationScreenTexts.navigationTitle,
                center: true,
              ),
              SizedBox(height: 20),
              ListBulletPoints(
                  bulletPoints:
                      PsychologicalSocialEducationScreenTexts.bulletPoints,
                  addHorizontalPadding: true),
              SizedBox(height: 20),
            ],
          ),
        ));
  }
}

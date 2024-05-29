import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class PsychologicalSocialMotivationalMoreInfoScreen extends StatelessWidget {
  final String title;

  const PsychologicalSocialMotivationalMoreInfoScreen(
      {super.key, this.title = ''});

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
                text:
                    PsychologicalSocialMotivationalScreenTexts.navigationTitle,
                center: true,
              ),
              ListNumberPoints(
                  numberPoints: PsychologicalSocialMotivationalScreenTexts
                      .moreInfoListTexts),
              SizedBox(height: 20),
            ],
          ),
        ));
  }
}

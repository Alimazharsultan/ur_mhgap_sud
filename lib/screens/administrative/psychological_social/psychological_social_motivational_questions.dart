import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class PsychologicalSocialMotivationalMoreQuesScreen extends StatelessWidget {
  final String title;

  const PsychologicalSocialMotivationalMoreQuesScreen(
      {super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TitleText(
                  text: PsychologicalSocialScreenTexts.title,
                  addHorizontalPadding: true),
              SubTitleText(
                text:
                    PsychologicalSocialMotivationalScreenTexts.navigationTitle,
                center: true,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    InformationText(
                        text: PsychologicalSocialMotivationalScreenTexts
                            .moreQuesInfoText),
                    SizedBox(height: 20),
                    ListNumberPoints(
                        numberPoints: PsychologicalSocialMotivationalScreenTexts
                            .moreQueslistTexts),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

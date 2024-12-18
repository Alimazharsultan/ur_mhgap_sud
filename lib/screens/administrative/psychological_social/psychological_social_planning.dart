import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class PsychologicalSocialPlanningScreen extends StatelessWidget {
  final String title;

  const PsychologicalSocialPlanningScreen({super.key, this.title = ""});
  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TitleText(
                text: PsychologicalSocialPlanningScreenTexts.navigationTitle,
                addHorizontalPadding: true,
              ),
              SubTitleText(
                  text: PsychologicalSocialPlanningScreenTexts.title,
                  center: true),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationText(
                        text:
                            PsychologicalSocialPlanningScreenTexts.subHeading),
                    const SizedBox(height: 10),
                    const ListBulletPoints(
                        bulletPoints: PsychologicalSocialPlanningScreenTexts
                            .bulletPointList,
                        addHorizontalPadding: true),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/expandable_text.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class PsychologicalSocialStrategiesScreen extends StatelessWidget {
  final String title;

  const PsychologicalSocialStrategiesScreen({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const TitleText(
                text:
                    PsychologicalSocialStrategiesScreenText.navigationTitle,
                addHorizontalPadding: true,
              ),
              const SubTitleText(
                  text: PsychologicalSocialSupportGroupsScreenText.title,
                  center: true),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SubHeadingText(
                        text: PsychologicalSocialStrategiesScreenText
                            .supportHeading,
                        ),
                    ...PsychologicalSocialStrategiesScreenText.expandableTexts
                        .map((expandableText) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          ExpandableText(
                            title: expandableText['title'],
                            listTexts:
                                List<String>.from(expandableText['listTexts']),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

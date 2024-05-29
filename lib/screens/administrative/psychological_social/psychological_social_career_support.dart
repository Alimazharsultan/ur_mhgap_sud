import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class PsychologicalSocialCareerSupportScreen extends StatelessWidget {
  final String title;

  const PsychologicalSocialCareerSupportScreen({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const TitleText(
                text: PsychologicalSocialCareerSupportScreenText.navigationText,
                addHorizontalPadding: true,
              ),
              const SubTitleText(
                  text: PsychologicalSocialCareerSupportScreenText.title,
                  center: true),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SubHeadingText(
                      text: PsychologicalSocialCareerSupportScreenText
                          .headingText,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.only(right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: PsychologicalSocialCareerSupportScreenText
                            .bulletPointList
                            .asMap()
                            .entries
                            .map((entry) {
                          String text = entry
                              .value; // Assuming this is a correct representation of your data structure.
                          return BulletPoint(text: text);
                        }).toList(), // Convert the Iterable to a List.
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

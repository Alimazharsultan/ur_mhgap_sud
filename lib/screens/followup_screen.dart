import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/divider_components.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/colors.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class FollowupScreen extends StatelessWidget {
  const FollowupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: FollowupScreenTexts.navigationText,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const HeadingText(
              text: FollowupScreenTexts.title1,
              color: followupHeadingColor,
            ),
            const HeadingDividerLine(addPadding: true),
            ...FollowupScreenTexts.frequencyContactRecommendations
                .asMap()
                .entries
                .map((entry) {
              String boldText = entry.value["boldText"];
              String normalText = entry.value["normalText"];
              return (ArrowBulletPoint(
                  boldText: boldText,
                  normalText: normalText,
                  arrowColor: bodyTextColor));
            }),
            const SizedBox(height: 20),
            const HeadingText(
              text: FollowupScreenTexts.title2,
              color: followupHeadingColor,
            ),
            const HeadingDividerLine(addPadding: true),
            ...FollowupScreenTexts.assessForImprovements
                .asMap()
                .entries
                .map((entry) {
              String listHeading = entry.value["heading"];
              List<Map<String, String>> listArrowBulletPoints =
                  entry.value["bulletPoints"];
              return Column(
                children: [
                  SubHeadingText(text: listHeading, addHorizontalPadding: true),
                  ...listArrowBulletPoints
                      .where((bulletPoint) => bulletPoint["text"] != null)
                      .map((Map<String, String> bulletPoint) {
                    return ArrowBulletPoint(
                        boldText: '',
                        arrowColor: bodyTextColor,
                        normalText: bulletPoint["text"]!);
                  }),
                  const SizedBox(height: 10),
                ],
              );
            }),
            const SizedBox(height: 20)
          ],
        ),
      ),
    );
  }
}

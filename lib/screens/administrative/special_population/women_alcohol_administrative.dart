import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class WomenAlcoholAdviceScreen extends StatelessWidget {
  const WomenAlcoholAdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  children: [
                    const TitleText(
                        text: SpecialPopulationScreenText.population3Title),
                    const SubTitleText(
                        text: SpecialPopulationScreenText.population3Screen1,
                        center: true),
                    ...SpecialPopulationScreenText.alcoholBulletPoints
                        .map((bulletPoint) {
                      return BulletPoint(
                        text: bulletPoint['text'],
                        topMargin: bulletPoint['topMargin']
                      );
                    }),
                    const SizedBox(height: 30),
                    const CautionText(),
                    const InformationText(
                        text: SpecialPopulationScreenText.warningText,
                        horizontalPadding: 30)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

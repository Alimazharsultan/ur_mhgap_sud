import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class WomenDrugAdviceScreen extends StatelessWidget {
  const WomenDrugAdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: HomeAdministrativeSreenText.navigationText,
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          const TitleText(
              text: SpecialPopulationScreenText.womenDrugAbuseScreenTitle, addHorizontalPadding: true),
          const SubTitleText(
              text: SpecialPopulationScreenText.population3Screen2,
              center: true),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: SpecialPopulationScreenText.drugsBulletPoints
                  .map((bulletPoint) {
                return BulletPoint(
                  text: bulletPoint['text'] as String,
                  topMargin: bulletPoint['topMargin'] as double,
                );
              }).toList(),
            ),
          ),
        ],
      )),
    );
  }
}

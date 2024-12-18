import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class MedicalAdviceScreen extends StatelessWidget {
  const MedicalAdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const TitleText(
                text: SpecialPopulationScreenText.popoulation1Heading,
                addHorizontalPadding: true,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SubTitleText(
                        text:
                            SpecialPopulationScreenText.popoulation1SubHeading,
                        center: true),
                    const SizedBox(height: 10),
                    ...SpecialPopulationScreenText.popoulation1BulletPoints
                        .map((point) {
                      return ArrowBulletPoint(normalText: point);
                    })
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/components/next_button.dart';
import 'package:mhgap_urdu/screens/administrative/tablets_administrative.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class Protocol3TreatmentDrugs extends StatelessWidget {
  const Protocol3TreatmentDrugs({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TitleText(
                          text: Protocol3AdministrativeSreenTexts.title,
                          ),
                      SubTitleText(
                          text: Protocol3AdministrativeSreenTexts
                              .treatmentDrugsTitle,
                          center: true),
                      InformationText(
                          text: Protocol3AdministrativeSreenTexts
                              .treatmentDrugsInfo1),
                      SizedBox(height: 30),
                      ListBulletPoints(
                          bulletPoints: Protocol3AdministrativeSreenTexts
                              .treatmentDrugsBulletPoints),
                      CautionText(),
                      InformationText(
                          text: Protocol3AdministrativeSreenTexts
                              .treatmentDrugsInfo2),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
          NextButton(
            title: Protocol3AdministrativeSreenTexts.tabletListTitle,
            screen: TabletsAdministrativeScreen(),
          ),
        ]));
  }
}

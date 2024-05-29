import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/components/next_button.dart';
import 'package:mhgap_urdu/screens/administrative/tablets_administrative.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class Protocol4AdministrativeScreen extends StatelessWidget {
  const Protocol4AdministrativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TitleText(
                    text: Protocol4AdministrativeSreenTexts.heading, addHorizontalPadding: true
                    ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CautionText(),
                      InformationText(
                          text: Protocol4AdministrativeSreenTexts
                              .informationText),
                      SizedBox(height: 20),
                      ListBulletPoints(
                          bulletPoints:
                              Protocol4AdministrativeSreenTexts.bulletPoints, addHorizontalPadding: true),
                      SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
          NextButton(
            title: Protocol4AdministrativeSreenTexts.buttonText,
            screen: TabletsAdministrativeScreen(),
          ),
        ]));
  }
}

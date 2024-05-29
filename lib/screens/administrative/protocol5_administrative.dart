import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/next_button.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/administrative/tablets_administrative.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class Protocol5AdministrativeScreen extends StatelessWidget {
  const Protocol5AdministrativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: Stack(children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TitleText(
                  text: Protocol5AdministrativeSreenTexts.heading,
                  addHorizontalPadding: true,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20),
                      ListBulletPoints(
                          bulletPoints:
                              Protocol5AdministrativeSreenTexts.bulletPoints,
                          addHorizontalPadding: true),
                      SizedBox(height: 80),
                    ],
                  ),
                ),
              ],
            ),
          ),
          NextButton(
            title: Protocol5AdministrativeSreenTexts.buttonText,
            screen: TabletsAdministrativeScreen(),
          ),
        ]));
  }
}

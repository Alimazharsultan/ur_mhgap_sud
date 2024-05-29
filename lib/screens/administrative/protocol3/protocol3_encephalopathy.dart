import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class Protocol3EncephalopathyScreen extends StatelessWidget {
  const Protocol3EncephalopathyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TitleText(
                text: Protocol3AdministrativeSreenTexts.encephalopathSubTitle,
                addHorizontalPadding: true,
              ),
              SubTitleText(
                  text: Protocol3AdministrativeSreenTexts.encephalopathTitle,
                  center: true),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: ListBulletPoints(
                    bulletPoints: Protocol3AdministrativeSreenTexts
                        .encephalopathBulletPoints,
                    isRedText: false,
                  )),
            ],
          ),
        ));
  }
}

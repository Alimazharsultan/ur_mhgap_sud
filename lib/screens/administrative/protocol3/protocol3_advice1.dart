import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class Protocol3Advice1Screen extends StatelessWidget {
  const Protocol3Advice1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TitleText(
                  text: Protocol3AdministrativeSreenTexts.encephalopathSubTitle,
                  addHorizontalPadding: true),
              SubTitleText(
                  text: Protocol3AdministrativeSreenTexts.protocolAdviceTitle,
                  center: true),
              InformationText(
                  text: Protocol3AdministrativeSreenTexts
                      .protocolAdvice1InfoText1),
              SizedBox(height: 20),
              ListBulletPoints(
                bulletPoints: Protocol3AdministrativeSreenTexts
                    .protocolAdvice1BulletPoints,
                addHorizontalPadding: true,
              ),
              SizedBox(height: 20),
              InformationText(
                  text: Protocol3AdministrativeSreenTexts
                      .protocolAdvice1InfoText2,
                  horizontalPadding: 30),
              SizedBox(height: 20),
            ],
          ),
        ));
  }
}

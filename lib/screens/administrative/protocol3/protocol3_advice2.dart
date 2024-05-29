import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class Protocol3Advice2Screen extends StatelessWidget {
  const Protocol3Advice2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TitleText(
                text: Protocol3AdministrativeSreenTexts.encephalopathSubTitle,
              ),
              SubTitleText(
                  text: Protocol3AdministrativeSreenTexts.protocolAdviceTitle,
                  center: true),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationText(
                        text: Protocol3AdministrativeSreenTexts
                            .protocolAdvice2InfoText),
                    ListBulletPoints(
                      bulletPoints: Protocol3AdministrativeSreenTexts
                          .protocolAdvice2BulletPoints, addHorizontalPadding: true,
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/divider_components.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class Protocol2OpoidsScreen extends StatelessWidget {
  const Protocol2OpoidsScreen({super.key});

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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const TitleText(
                        text: Protocol2AdministrativeSreenTexts.opoidsTitle,
                        ),
                    const SubTitleText(
                      text: Protocol2AdministrativeSreenTexts.opoidsSubTitle,
                      center: true,
                    ),
                    const DividerLine(),
                    const SizedBox(height: 10),
                    NavigationRow(
                      title: Protocol2AdministrativeSreenTexts.navigationRow1,
                      onPressed: () {},
                      showBottomBar: false,
                    ),
                    const SizedBox(height: 10),
                    const ListBulletPoints(
                    bulletPoints: Protocol2AdministrativeSreenTexts
                        .navigationRow1BulletPoints, isRedText: false),
                    const SizedBox(height: 20),
                    const DividerLine(),
                    const SizedBox(height: 10),
                    NavigationRow(
                      title: Protocol2AdministrativeSreenTexts.navigationRow2,
                      onPressed: () {},
                      showBottomBar: false,
                    ),
                    const InformationText(
                        text: Protocol2AdministrativeSreenTexts
                            .navigationRow2InfoText),
                    const SizedBox(height: 20),
                    const DividerLine(),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/divider_components.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class Protocol2AlcoholScreen extends StatelessWidget {
  const Protocol2AlcoholScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TitleText(
                    text: Protocol2AdministrativeSreenTexts.title,
                    ),
                const SubTitleText(
                    text: Protocol2AdministrativeSreenTexts.alcoholTitle,
                    center: true),
                const SizedBox(height: 20),
                NavigationRow(
                  title:
                      Protocol2AdministrativeSreenTexts.alcoholNavigationRow1,
                  onPressed: () {},
                  showBottomBar: false,
                ),
                const SizedBox(height: 10),
                const ListBulletPoints(
                    bulletPoints: Protocol2AdministrativeSreenTexts
                        .alcoholNavigationRow1BulletPoints,
                    isRedText: false),
                const SizedBox(height: 20),
                const DividerLine(),
                const SizedBox(height: 10),
                const InformationText(
                    text: Protocol2AdministrativeSreenTexts.alcoholInfoText1),
                const SizedBox(height: 20),
                const DividerLine(),
                const SizedBox(height: 10),
                NavigationRow(
                  title:
                      Protocol2AdministrativeSreenTexts.alcoholNavigationRow2,
                  onPressed: () {},
                  showBottomBar: false,
                ),
                const SizedBox(height: 10),
                const ListBulletPoints(
                    bulletPoints: Protocol2AdministrativeSreenTexts
                        .alcoholNavigationRow2BulletPoints,
                    isRedText: false),
              ],
            ),
          ),
        ));
  }
}

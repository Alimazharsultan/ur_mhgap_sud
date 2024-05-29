import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class Protocol2AllScreen extends StatelessWidget {
  const Protocol2AllScreen({super.key});

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
                  text: Protocol2AdministrativeSreenTexts.allCaseTitle,
                  center: true),
              NavigationRow(
                title: Protocol2AdministrativeSreenTexts.allNavigationRow1,
                onPressed: () {},
              ),
              const InformationText(
                  text:
                      Protocol2AdministrativeSreenTexts.allNavigationRow1Info),
              const SizedBox(height: 20),
              const Divider(color: Colors.orange, height: 2),
              const SizedBox(height: 10),
              NavigationRow(
                title: Protocol2AdministrativeSreenTexts.allNavigationRow2,
                onPressed: () {},
              ),
              const InformationText(
                  text:
                      Protocol2AdministrativeSreenTexts.allNavigationRow1Info),
              const ListBulletPoints(
                  bulletPoints: Protocol2AdministrativeSreenTexts
                      .allNavigationRow2BulletPoints,
                  addHorizontalPadding: true),
              const SizedBox(height: 20),
              const Divider(color: Colors.orange, height: 2),
              const SizedBox(height: 10),
            ],
          ),
        )));
  }
}

import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class Protocol2OtherScreen extends StatelessWidget {
  const Protocol2OtherScreen({super.key});

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
                  text: Protocol2AdministrativeSreenTexts.otherTitle,
                  center: true),
              const InformationText(
                  text: Protocol2AdministrativeSreenTexts.otherBasicGuideline),
              const SizedBox(height: 10),
              const Divider(color: Colors.orange, height: 2),
              const SizedBox(height: 10),
              NavigationRow(
                title: Protocol2AdministrativeSreenTexts.otherNavigationRow1,
                onPressed: () {},
              ),
              NavigationRow(
                title: Protocol2AdministrativeSreenTexts.otherNavigationRow2,
                onPressed: () {},
              ),
              ...Protocol2AdministrativeSreenTexts.otherNavigationRow2Info
                  .map((text) {
                return (Column(children: [
                  InformationText(text: text),
                  const SizedBox(height: 10),
                  const Divider(color: Colors.orange, height: 2),
                  const SizedBox(height: 10),
                ]));
              }),
            ],
          ),
        )));
  }
}

import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class PsychologicalSocialSupportGroupsScreen extends StatelessWidget {
  final String title;

  const PsychologicalSocialSupportGroupsScreen({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TitleText(
                text:
                    PsychologicalSocialSupportGroupsScreenText.navigationTitle,
                addHorizontalPadding: true,
              ),
              SubTitleText(
                  text: PsychologicalSocialSupportGroupsScreenText.title,
                  center: true),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InformationText(
                        text: PsychologicalSocialSupportGroupsScreenText
                            .informationText),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

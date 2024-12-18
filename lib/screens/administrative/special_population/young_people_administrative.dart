import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/expandable_text.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class YoungPeopleAdviceScreen extends StatelessWidget {
  // Constructor with required title parameter
  const YoungPeopleAdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const TitleText(
                  text: SpecialPopulationScreenText.population2Title, addHorizontalPadding: true,
                  ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: SpecialPopulationScreenText
                      .population2ExpandableLists
                      .map((item) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        ExpandableText(
                          title: item['title'],
                          listTexts: List<String>.from(item['listTexts']),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: DescriptionScreenTexts.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ...DescriptionScreenTexts.descriptions
                  .asMap()
                  .entries
                  .map((entry) {
                String boldText = entry.value["boldText"];
                String normalText = entry.value["normalText"];
                return (DescriptionText(
                    boldText: boldText, normalText: normalText, horizontalPadding: 30, verticalPadding: 20,));
              }),
              const SizedBox(height: 40)
            ],
          ),
        ));
  }
}

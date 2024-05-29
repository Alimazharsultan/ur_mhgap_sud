import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/administrative/tablets_three_buttons_administrative.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class TabletsListScreen extends StatelessWidget {
  final String title;
  final String subTitle;
  final List tablets;

  const TabletsListScreen(
      {super.key,
      required this.title,
      required this.subTitle,
      this.tablets = const []});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: <Widget>[
                      TitleText(text: title),
                      SubTitleText(text: subTitle, center: true),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: tablets.asMap().entries.map((entry) {
                          // int idx = entry.key + 1;
                          String name = entry.value["name"];
                          List<Map<String, String>> castedButtons = entry
                                      .value["buttons"] !=
                                  null
                              ? List<Map<String, String>>.from(
                                  entry.value["buttons"].map(
                                      (item) => Map<String, String>.from(item)))
                              : <Map<String,
                                  String>>[]; // Assuming this is a correct representation of your data structure.
                          return NavigationRow(
                            title: name,
                            onPressed: () {
                              navigateWithSlideTransition(
                                context,
                                ThreeButtonTabletInfoScreen(
                                  title: name,
                                  buttons: castedButtons,
                                ),
                              );
                            },
                          );
                        }).toList(), // Convert the Iterable to a List.
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

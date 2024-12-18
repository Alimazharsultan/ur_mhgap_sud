import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/administrative/tablets_list.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class TabletsAdministrativeScreen extends StatelessWidget {
  const TabletsAdministrativeScreen({super.key});

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
                      const TitleText(
                        text: Protocol3AdministrativeSreenTexts.tabletListTitle),
                      ...Protocol3AdministrativeSreenTexts.tabletsNavigationRows
                          .map((row) {
                        return NavigationRow(
                            title: row['title'],
                            subText: row['subText'],
                            onPressed: () {
                              navigateWithSlideTransition(
                                context,
                                TabletsListScreen(
                                  title: row['title'],
                                  subTitle: row['subText'],
                                  tablets: List<Map<String, dynamic>>.from(
                                      row['tablets']),
                                ),
                              );
                            });
                      }),
                    ],
                  )),
            ],
          ),
        ));
  }
}

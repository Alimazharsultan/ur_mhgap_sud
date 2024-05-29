import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/administrative/protocol2/protocol2_alcohol.dart';
import 'package:mhgap_urdu/screens/administrative/protocol2/protocol2_all.dart';
import 'package:mhgap_urdu/screens/administrative/protocol2/protocol2_benzodiazepines.dart';
import 'package:mhgap_urdu/screens/administrative/protocol2/protocol2_opoids.dart';
import 'package:mhgap_urdu/screens/administrative/protocol2/protocol2_others.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class Protocol2AdministrativeSreen extends StatelessWidget {
  const Protocol2AdministrativeSreen({super.key});

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
                          text: Protocol2AdministrativeSreenTexts.title,
                          ),
                      NavigationRow(
                        title: Protocol2AdministrativeSreenTexts.opoidsTitle,
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const Protocol2OpoidsScreen());
                        },
                      ),
                      NavigationRow(
                        title: Protocol2AdministrativeSreenTexts.benzoTitle,
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const Protocol2BenzodiazepinesScreen());
                        },
                      ),
                      NavigationRow(
                        title: Protocol2AdministrativeSreenTexts.alcoholTitle,
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const Protocol2AlcoholScreen());
                        },
                      ),
                      NavigationRow(
                        title: Protocol2AdministrativeSreenTexts.otherTitle,
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const Protocol2OtherScreen());
                        },
                      ),
                      NavigationRow(
                        title: Protocol2AdministrativeSreenTexts.allCaseTitle,
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const Protocol2AllScreen());
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

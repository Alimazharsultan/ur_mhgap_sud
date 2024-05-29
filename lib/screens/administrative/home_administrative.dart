import 'package:flutter/material.dart';

import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/administrative/protocol1_administrative.dart';
import 'package:mhgap_urdu/screens/administrative/protocol2/protocol2_administrative.dart';
import 'package:mhgap_urdu/screens/administrative/protocol3/protocol3_administrative.dart';
import 'package:mhgap_urdu/screens/administrative/protocol4_administrative.dart';
import 'package:mhgap_urdu/screens/administrative/protocol5_administrative.dart';
import 'package:mhgap_urdu/screens/administrative/protocol6_administrative.dart';
import 'package:mhgap_urdu/screens/administrative/psychological_social/psychological_social_administrative.dart';
import 'package:mhgap_urdu/screens/administrative/special_population_administrative.dart';
import 'package:mhgap_urdu/screens/administrative/tablets_administrative.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class HomeAdministrativeSreen extends StatelessWidget {
  const HomeAdministrativeSreen({super.key});

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
                      const TitleText(text: HomeAdministrativeSreenText.title),
                      NavigationRow(
                        title: SpecialPopulationScreenText.title,
                        onPressed: () {
                          navigateWithSlideTransition(
                            context,
                            const SpecialPopulationScreen(),
                          );
                        },
                      ),
                      NavigationRow(
                        title: Protocol1AdministrativeSreenTexts.title,
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const Protocol1AdministrativeSreen());
                        },
                      ),
                      NavigationRow(
                        title: Protocol2AdministrativeSreenTexts.title,
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const Protocol2AdministrativeSreen());
                        },
                      ),
                      NavigationRow(
                        title: Protocol3AdministrativeSreenTexts.title,
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const Protocol3AdministrativeSreen());
                        },
                      ),
                      NavigationRow(
                        title: Protocol4AdministrativeSreenTexts.title,
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const Protocol4AdministrativeScreen());
                        },
                      ),
                      NavigationRow(
                        title: Protocol5AdministrativeSreenTexts.title,
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const Protocol5AdministrativeScreen());
                        },
                      ),
                      NavigationRow(
                        title: Protocol6AdministrativeSreenTexts.title,
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const Protocol6AdministrativeScreen());
                        },
                      ),
                      NavigationRow(
                        title: PsychologicalSocialScreenTexts.title,
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const PsychologicalSocialScreen());
                        },
                      ),
                      NavigationRow(
                        title: ' ادویات کے ذریعے علاج',
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const TabletsAdministrativeScreen());
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

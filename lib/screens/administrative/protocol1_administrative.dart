import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/administrative/psychological_social/psychological_social_education.dart';
import 'package:mhgap_urdu/screens/administrative/psychological_social/psychological_social_motivational_questions.dart';
import 'package:mhgap_urdu/screens/administrative/psychological_social/psychological_social_strategies.dart';
import 'package:mhgap_urdu/screens/administrative/special_population_administrative.dart';
import 'package:mhgap_urdu/screens/followup_screen.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class Protocol1AdministrativeSreen extends StatelessWidget {
  const Protocol1AdministrativeSreen({super.key});

  @override
  Widget build(BuildContext context) {
    const navigationRows = Protocol1AdministrativeSreenTexts.navigationRows;
    const navigationStrategies =
        Protocol1AdministrativeSreenTexts.navigationStrategies;
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
                          text: Protocol1AdministrativeSreenTexts.title),
                      NavigationRow(
                        title: navigationRows[0]['title'],
                        subText: navigationRows[0]['subText'],
                        onPressed: () {
                          navigateWithSlideTransition(
                              context, const SpecialPopulationScreen());
                        },
                      ),
                      NavigationRow(
                        title: navigationRows[1]['title'],
                        subText: navigationRows[1]['subText'],
                        onPressed: () {
                          navigateWithSlideTransition(context,
                              const PsychologicalSocialEducationScreen());
                        },
                      ),
                      NavigationRow(
                        title: navigationRows[2]['title'],
                        subText: navigationRows[2]['subText'],
                        onPressed: () {
                          navigateWithSlideTransition(context,
                              const PsychologicalSocialMotivationalMoreQuesScreen());
                        },
                      ),
                      const InformationText(
                          text: Protocol1AdministrativeSreenTexts
                              .informationText1),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.orange, height: 2),
                      const SizedBox(height: 10),
                      NavigationRow(
                        title: navigationStrategies[0]['title'],
                        onPressed: () {
                          navigateWithSlideTransition(context,
                              const PsychologicalSocialStrategiesScreen());
                        },
                      ),
                      NavigationRow(
                        title: navigationStrategies[1]['title'],
                        onPressed: () {
                          navigateWithSlideTransition(context,
                              const PsychologicalSocialStrategiesScreen());
                        },
                      ),
                      const InformationText(
                          text: Protocol1AdministrativeSreenTexts
                              .informationText2),
                      const SizedBox(height: 20),
                      const Divider(color: Colors.orange, height: 2),
                      const SizedBox(height: 10),
                      NavigationRow(
                        title: 'فالو اپ',
                        onPressed: () {
                          navigateFromHomeScreen(
                              context, const FollowupScreen());
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

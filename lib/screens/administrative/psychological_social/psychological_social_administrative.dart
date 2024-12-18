import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/administrative/psychological_social/psychological_social_career_support.dart';
import 'package:mhgap_urdu/screens/administrative/psychological_social/psychological_social_education.dart';
import 'package:mhgap_urdu/screens/administrative/psychological_social/psychological_social_motivational.dart';
import 'package:mhgap_urdu/screens/administrative/psychological_social/psychological_social_planning.dart';
import 'package:mhgap_urdu/screens/administrative/psychological_social/psychological_social_strategies.dart';
import 'package:mhgap_urdu/screens/administrative/psychological_social/psychological_social_support_groups.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class PsychologicalSocialScreen extends StatelessWidget {
  const PsychologicalSocialScreen({super.key});

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
                          text: PsychologicalSocialScreenTexts.title,
                          ),
                      const SizedBox(height: 20),
                      NavigationRow(
                        title: PsychologicalSocialEducationScreenTexts
                            .navigationTitle,
                        onPressed: () {
                          navigateWithSlideTransition(context,
                              const PsychologicalSocialEducationScreen());
                        },
                      ),
                      NavigationRow(
                        title: PsychologicalSocialMotivationalScreenTexts
                            .navigationTitle,
                        onPressed: () {
                          navigateWithSlideTransition(context,
                              const PsychologicalSocialMotivationalScreen());
                        },
                      ),
                      NavigationRow(
                        title: PsychologicalSocialPlanningScreenTexts
                            .navigationTitle,
                        onPressed: () {
                          navigateWithSlideTransition(context,
                              const PsychologicalSocialPlanningScreen());
                        },
                      ),
                      NavigationRow(
                        title: PsychologicalSocialSupportGroupsScreenText
                            .navigationTitle,
                        onPressed: () {
                          navigateWithSlideTransition(context,
                              const PsychologicalSocialSupportGroupsScreen());
                        },
                      ),
                      NavigationRow(
                        title: PsychologicalSocialStrategiesScreenText
                            .navigationTitle,
                        onPressed: () {
                          navigateWithSlideTransition(context,
                              const PsychologicalSocialStrategiesScreen());
                        },
                      ),
                      NavigationRow(
                        title: PsychologicalSocialCareerSupportScreenText
                            .navigationText,
                        onPressed: () {
                          navigateWithSlideTransition(context,
                              const PsychologicalSocialCareerSupportScreen());
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

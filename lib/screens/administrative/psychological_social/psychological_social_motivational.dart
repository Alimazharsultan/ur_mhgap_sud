import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/administrative/psychological_social/psychological_social_motivational_intro.dart';
import 'package:mhgap_urdu/screens/administrative/psychological_social/psychological_social_motivational_more_info.dart';
import 'package:mhgap_urdu/screens/administrative/psychological_social/psychological_social_motivational_questions.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class PsychologicalSocialMotivationalScreen extends StatelessWidget {
  final String title;

  const PsychologicalSocialMotivationalScreen({super.key, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const TitleText(
                text: PsychologicalSocialScreenTexts.title,
                addHorizontalPadding: true,
              ),
              const SubTitleText(
                text:
                    PsychologicalSocialMotivationalScreenTexts.navigationTitle,
                center: true,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    NavigationRow(
                      title: PsychologicalSocialMotivationalScreenTexts
                          .introScreenTitle,
                      onPressed: () {
                        navigateWithSlideTransition(context,
                            const PsychologicalSocialMotivationalIntroScreen());
                      },
                    ),
                    NavigationRow(
                      title: PsychologicalSocialMotivationalScreenTexts
                          .moreInforTitle,
                      onPressed: () {
                        navigateWithSlideTransition(context,
                            const PsychologicalSocialMotivationalMoreInfoScreen());
                      },
                    ),
                    NavigationRow(
                      title: PsychologicalSocialMotivationalScreenTexts
                          .moreQuesTitle,
                      onPressed: () {
                        navigateWithSlideTransition(context,
                            const PsychologicalSocialMotivationalMoreQuesScreen());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

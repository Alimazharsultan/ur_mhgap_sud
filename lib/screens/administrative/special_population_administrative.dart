import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/administrative/special_population/medical_advice_administrative.dart';
import 'package:mhgap_urdu/screens/administrative/special_population/women_administrative.dart';
import 'package:mhgap_urdu/screens/administrative/special_population/young_people_administrative.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class SpecialPopulationScreen extends StatelessWidget {
  const SpecialPopulationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const TitleText(text: SpecialPopulationScreenText.title, addHorizontalPadding: true,),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: Column(
                    children: <Widget>[
                      NavigationRow(
                        title: SpecialPopulationScreenText.population1Title,
                        onPressed: () {
                          navigateWithSlideTransition(
                            context,
                            const MedicalAdviceScreen(),
                          );
                        },
                      ),
                      NavigationRow(
                        title: SpecialPopulationScreenText.population2Title,
                        onPressed: () {
                          navigateWithSlideTransition(
                            context,
                            const YoungPeopleAdviceScreen(),
                          );
                        },
                      ),
                      NavigationRow(
                        title: SpecialPopulationScreenText.population3Title,
                        onPressed: () {
                          navigateWithSlideTransition(
                            context,
                            const WomenAdviceScreen(),
                          );
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ));
  }
}

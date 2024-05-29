import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/administrative/special_population/women_alcohol_administrative.dart';
import 'package:mhgap_urdu/screens/administrative/women_drugs_administrative.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class WomenAdviceScreen extends StatelessWidget {
  const WomenAdviceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const TitleText(
                  text: SpecialPopulationScreenText.population3Title, addHorizontalPadding: true,
                  ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    NavigationRow(
                      title: SpecialPopulationScreenText.population3Screen1,
                      onPressed: () {
                        navigateWithSlideTransition(
                          context,
                          const WomenAlcoholAdviceScreen(),
                        );
                      },
                    ),
                    NavigationRow(
                      title: SpecialPopulationScreenText.population3Screen2,
                      onPressed: () {
                        navigateWithSlideTransition(
                          context,
                          const WomenDrugAdviceScreen(),
                        );
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

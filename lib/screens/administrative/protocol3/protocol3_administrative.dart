import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/divider_components.dart';
import 'package:mhgap_urdu/components/navigation_row.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/administrative/protocol3/protocol3_advice1.dart';
import 'package:mhgap_urdu/screens/administrative/protocol3/protocol3_advice2.dart';
import 'package:mhgap_urdu/screens/administrative/protocol3/protocol3_encephalopathy.dart';
import 'package:mhgap_urdu/screens/administrative/protocol3/protocol3_treatment_drugs.dart';
import 'package:mhgap_urdu/screens/administrative/tablets_administrative.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class Protocol3AdministrativeSreen extends StatelessWidget {
  const Protocol3AdministrativeSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        title: HomeAdministrativeSreenText.navigationText,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const TitleText(
                  text: Protocol3AdministrativeSreenTexts.title, addHorizontalPadding: true,),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    ...Protocol3AdministrativeSreenTexts.informationTexts
                        .map((text) {
                      return (Column(children: [
                        InformationText(text: text),
                        const SizedBox(height: 10),
                        const DividerLine(),
                        const SizedBox(height: 20),
                      ]));
                    }),
                    NavigationRow(
                      title:
                          Protocol3AdministrativeSreenTexts.treatmentDrugsTitle,
                      onPressed: () {
                        navigateWithSlideTransition(
                            context, const Protocol3TreatmentDrugs());
                      },
                    ),
                    NavigationRow(
                      title: Protocol3AdministrativeSreenTexts.tabletListTitle,
                      onPressed: () {
                        navigateWithSlideTransition(
                            context, const TabletsAdministrativeScreen());
                      },
                    ),
                    NavigationRow(
                      title:
                          Protocol3AdministrativeSreenTexts.encephalopathTitle,
                      onPressed: () {
                        navigateWithSlideTransition(
                            context, const Protocol3EncephalopathyScreen());
                      },
                    ),
                    NavigationRow(
                      title:
                          Protocol3AdministrativeSreenTexts.protocolAdviceTitle,
                      subText: Protocol3AdministrativeSreenTexts
                          .protocolAdvice1SubText,
                      onPressed: () {
                        navigateWithSlideTransition(
                            context, const Protocol3Advice1Screen());
                      },
                    ),
                    NavigationRow(
                      title:
                          Protocol3AdministrativeSreenTexts.protocolAdviceTitle,
                      subText: Protocol3AdministrativeSreenTexts
                          .protocolAdvice2SubText,
                      onPressed: () {
                        navigateWithSlideTransition(
                            context, const Protocol3Advice2Screen());
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

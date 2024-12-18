import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/CustomNavigationButton%20.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/screens/further_information/acknowledgement_screen.dart';
import 'package:mhgap_urdu/screens/further_information/disclaimer.dart';
import 'package:mhgap_urdu/screens/further_information/pdf_screen.dart';
import 'package:mhgap_urdu/screens/further_information/tutorial.dart';
import 'package:mhgap_urdu/utils/colors.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class FurtherInformationScreen extends StatelessWidget {
  const FurtherInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScaffold(
      showSource: false,
      title: FurtherInformation.screenTitle,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomNavigationButton(
              destinationScreen: PdfScreen(),
              buttonText: 'Complete PDF',
            ),
            SizedBox(height: 20),
            CustomNavigationButton(
              destinationScreen: AcknowledgementScreen(),
              buttonText: 'Acknowledgement',
            ),
            SizedBox(height: 20),
            CustomNavigationButton(
              destinationScreen: DisclaimerScreen(),
              buttonText: 'Disclaimer',
            ),
            SizedBox(height: 20),
            CustomNavigationButton(
              destinationScreen: TutorialScreen(),
              buttonText: 'Tutorial',
            ),
          ],
        ),
      ),
    );
  }
}

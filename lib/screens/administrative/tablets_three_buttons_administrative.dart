import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/custom_text_buttons.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class ThreeButtonTabletInfoScreen extends StatefulWidget {
  final String title;
  final List<Map<String, String>> buttons;

  const ThreeButtonTabletInfoScreen({
    super.key,
    required this.title,
    required this.buttons,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PsychoactiveAlcoholState createState() => _PsychoactiveAlcoholState();
}

class _PsychoactiveAlcoholState extends State<ThreeButtonTabletInfoScreen> {
  String displayedText = '';
  @override
  void initState() {
    super.initState();
    // Initialize the displayedText here with the first button's displayText
    displayedText = widget.buttons[widget.buttons.length - 1]["displayText"]!;
  }

  void updateText(String newText) {
    setState(() {
      displayedText = newText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: HomeAdministrativeSreenText.navigationText,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TitleText(text: widget.title, addHorizontalPadding: true),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.buttons.asMap().entries.map((entry) {
                    int idx = entry.key;
                    Map<String, String> button = entry.value;
                    return Flexible(
                      flex: 1, // Each CustomTextButton will have equal space
                      child: CustomTextButton(
                        buttonText: button['buttonText']!,
                        displayText: button['displayText']!,
                        onUpdateText: updateText,
                        currentDisplayedText: displayedText,
                        isCenter: idx != 0 && idx != widget.buttons.length - 1,
                      ),
                    );
                  }).toList(),
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InformationText(text: displayedText)
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

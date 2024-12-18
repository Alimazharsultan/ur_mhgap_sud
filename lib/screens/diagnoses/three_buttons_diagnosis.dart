import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/colors.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class ThreeButtonDiagnoseScreen extends StatefulWidget {
  final String arrowNavigatorText;
  final String title;
  final List<Map<String, String>> buttons;

  const ThreeButtonDiagnoseScreen({
    super.key,
    this.arrowNavigatorText = '',
    required this.title,
    required this.buttons,
  });

  @override
  // ignore: library_private_types_in_public_api
  _PsychoactiveAlcoholState createState() => _PsychoactiveAlcoholState();
}

class _PsychoactiveAlcoholState extends State<ThreeButtonDiagnoseScreen> {
  String displayedText = '';
  String boldText = '';
  double maxHeight = 0;

  @override
  void initState() {
    super.initState();
    // Initialize the displayedText here with the first button's displayText
    displayedText = widget.buttons[widget.buttons.length - 1]["displayText"]!;
    boldText = widget.buttons[widget.buttons.length - 1]["boldText"] ?? "";
  }

  void updateText(String newText, String newBoldText) {
    setState(() {
      displayedText = newText;
      boldText = newBoldText;
    });
  }

  void updateMaxHeight(double height) {
    if (height > maxHeight) {
      setState(() {
        maxHeight = height;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: DiagnosisScreen.title,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              TitleText(text: widget.title),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 70,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.buttons.asMap().entries.map((entry) {
                        int idx = entry.key;
                        Map<String, String> button = entry.value;
                        String buttonText = button['buttonText']!;
                        String displayText = button['displayText']!;
                        String boldText = button['boldText'] ?? '';
                        bool isActive = displayedText == displayText;
                        GlobalKey key = GlobalKey();

                        return Flexible(
                          flex:
                              1, // Each CustomTextButton will have equal space
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              WidgetsBinding.instance.addPostFrameCallback((_) {
                                final keyContext = key.currentContext;
                                if (keyContext != null) {
                                  final height = keyContext.size?.height ?? 0;
                                  updateMaxHeight(height);
                                }
                              });

                              return Container(
                                key: key,
                                height: maxHeight > 0 ? maxHeight : null,
                                decoration: BoxDecoration(
                                  color: isActive
                                      ? navigationBarColor
                                      : sideBarTextColor,
                                  border: idx != 0 &&
                                          idx != widget.buttons.length - 1
                                      ? const Border(
                                          top: BorderSide(
                                              width: 2.0,
                                              color: navigationBarColor),
                                          bottom: BorderSide(
                                              width: 2.0,
                                              color: navigationBarColor),
                                        )
                                      : Border.all(
                                          color: navigationBarColor,
                                          width: 2.0,
                                        ),
                                ),
                                child: TextButton(
                                  onPressed: () =>
                                      updateText(displayText, boldText),
                                  style: TextButton.styleFrom(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 8.0,
                                      horizontal: 10.0,
                                    ),
                                  ),
                                  child: BaseTextComponent(
                                    text: buttonText,
                                    color: isActive
                                        ? Colors.white
                                        : navigationBarColor,
                                    textAlign: TextAlign.center,
                                    // fontSize: 16,
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  InformationText(text: displayedText),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                          child: BaseTextComponent(
                              text: boldText,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              textAlign: TextAlign.right,
                              fontSize: 16))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

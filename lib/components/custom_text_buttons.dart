import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/colors.dart';

class CustomTextButton extends StatefulWidget {
  final String buttonText;
  final String displayText;
  final ValueChanged<String> onUpdateText;
  final String currentDisplayedText;
  final bool isCenter;

  const CustomTextButton({
    super.key,
    required this.buttonText,
    required this.displayText,
    required this.onUpdateText,
    required this.currentDisplayedText,
    this.isCenter = false,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextButtonState createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  late String displayedText;

  @override
  void initState() {
    super.initState();
    displayedText = '';
  }

  void updateText(String text) {
    setState(() {
      displayedText = text;
    });
    widget.onUpdateText(text);
  }

  @override
  Widget build(BuildContext context) {
    bool isActive = widget.currentDisplayedText == widget.displayText;
    return IntrinsicHeight(
      child: Container(
          decoration: BoxDecoration(
            color: isActive ? navigationBarColor : sideBarTextColor,
            border: widget.isCenter
                ? const Border(
                    top: BorderSide(width: 2.0, color: navigationBarColor),
                    bottom: BorderSide(width: 2.0, color: navigationBarColor),
                  )
                : Border.all(
                    color: navigationBarColor,
                    width: 2.0,
                  ),
          ),
          child: TextButton(
            onPressed: () => updateText(widget.displayText),
            style: TextButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
            ),
            child: BaseTextComponent(
              text: widget.buttonText,
              color: isActive ? Colors.white : navigationBarColor,
              textAlign: TextAlign.center,
              fontSize: 16,
            ),
          )),
    );
  }
}

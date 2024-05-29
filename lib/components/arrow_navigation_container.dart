import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/colors.dart';

class ArrowNavigationContainer extends StatelessWidget {
  final String text;
  final bool showBackButton;
  final VoidCallback? onEyePressed;

  const ArrowNavigationContainer({
    super.key,
    required this.text,
    this.showBackButton = true,
    this.onEyePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: navigationBarColor,
      height: 50,
      child: Stack(
        children: <Widget>[
          // Back arrow on the right
          if (showBackButton)
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward_ios,
                    color: sideBarTextColor),
                onPressed: () => {Navigator.pop(context)},
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              
              Container(
                alignment: Alignment.centerLeft,
                width: 150,
                child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: BaseTextComponent(
                      text: text,
                      color: sideBarTextColor,
                    )),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 50, // Adjust the height to fit your design needs
                  width: 2, // Adjust the width for the thickness of the divider
                  color: sideBarTextColor,
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: 150,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: BaseTextComponent(
                    text: 'نشہ آور اشیاء کا استعمال',
                    color: sideBarTextColor,
                    fontSize: normalTextSize,
                  ),
                ),
              ),
            ],
          ),
          // Eye icon on the left
          if (showBackButton)
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.remove_red_eye, color: sideBarTextColor),
                onPressed: () {
                  navigateHomeWithSlideTransition(context);
                },
              ),
            ),
        ],
      ),
    );
  }
}

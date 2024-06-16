import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/screens/home_screen.dart';
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
    // Get the screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;

    // Set the container width to half of the screen width
    double containerWidth = screenWidth / 2.8;

    return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          color: navigationBarColor,
          padding: const EdgeInsets.symmetric(vertical: 5),
          // height: 50,
          child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 40.0,
              ),
              child:
                  // Back arrow on the right
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                    if (showBackButton)
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(Icons.remove_red_eye,
                              color: sideBarTextColor),
                          onPressed: () {
                            navigateWithSlideTransition(
                                context, const SudHomeScreen());
                          },
                        ),
                      ),

                    Container(
                      alignment: Alignment.centerRight,
                      width: containerWidth,
                      child: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: BaseTextComponent(
                            text: text,
                            color: sideBarTextColor,
                          )),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height:
                            50, // Adjust the height to fit your design needs
                        width:
                            2, // Adjust the width for the thickness of the divider
                        color: sideBarTextColor,
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      width: containerWidth,
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: BaseTextComponent(
                          text: 'نشہ آور اشیاء کا استعمال',
                          color: sideBarTextColor,
                          fontSize: normalTextSize,
                        ),
                      ),
                    ),

                    // Eye icon on the left
                    if (showBackButton)
                      Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios,
                              color: sideBarTextColor),
                          onPressed: () => {Navigator.pop(context)},
                        ),
                      ),
                  ])),
        ));
  }
}

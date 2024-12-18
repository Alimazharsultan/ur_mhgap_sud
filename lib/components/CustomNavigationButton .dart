import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/colors.dart';

class CustomNavigationButton extends StatelessWidget {
  final Widget destinationScreen;
  final String buttonText;
  final Color backgroundColor;

  const CustomNavigationButton({
    super.key,
    required this.destinationScreen,
    required this.buttonText,
    this.backgroundColor = navigationBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        navigateWithSlideTransition(context, destinationScreen);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(
            left: 20.0, right: 20, top: 15, bottom: 25.0),
        decoration: BoxDecoration(
          color: backgroundColor, // The orange background color
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3), // Shadow color with opacity
              offset: const Offset(0, 4), // Offset for the shadow (x, y)
              blurRadius: 4.0, // Blur radius for the shadow
            ),
          ], // Adjust for rounded corners
        ),
        alignment: Alignment.center, // Center the child both vertically and horizontally
        child: BaseTextComponent(
          text: buttonText,
          fontSize: 14,
          textAlign: TextAlign.center,
          color: sideBarTextColor,
        ),
      ),
    );
  }
}

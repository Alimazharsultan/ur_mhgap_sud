import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/utils/colors.dart';

class NextButton extends StatelessWidget {
  final String title;
  final Widget screen;

  const NextButton({
    super.key,
    this.title = 'آگے بڑھیے',
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10.0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: GestureDetector(
          onTap: () {
            navigateWithSlideTransition(context, screen);
          },
          child: Container( 
            width: double.infinity,
            padding:
                const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: navigationBarColor, // The orange background color
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.3), // Shadow color with opacity
                  offset: const Offset(0, 4), // Offset for the shadow (x, y)
                  blurRadius: 4.0, // Blur radius for the shadow
                ),
              ], // Adjust for rounded corners
            ),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white, // Text color
                fontSize: 16, // Adjust the font size as needed
                fontFamily:
                    'Nastaliq', // Replace with the exact font if available
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}

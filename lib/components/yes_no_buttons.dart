import 'package:flutter/material.dart';

class YesNoButtons extends StatelessWidget {
  final VoidCallback onYesPressed;
  final VoidCallback onNoPressed;

  const YesNoButtons({
    super.key,
    required this.onYesPressed,
    required this.onNoPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10.0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: InkWell(
                onTap: onNoPressed,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  padding: const EdgeInsets.only(
                      right: 40.0, left: 40.0, top: 5, bottom: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(
                        255, 121, 0, 1), // The orange background color
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust for rounded corners
                  ),
                  child: const Text(
                    'نہیں',
                    style: TextStyle(
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
            Expanded(
              child: InkWell(
                onTap: onYesPressed,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  padding: const EdgeInsets.only(
                      right: 40.0, left: 40.0, top: 5, bottom: 15),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(
                        255, 121, 0, 1), // The orange background color
                    borderRadius: BorderRadius.circular(
                        10.0), // Adjust for rounded corners
                  ),
                  child: const Text(
                    'جی',
                    style: TextStyle(
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
          ],
        ),
      ),
    );
  }
}

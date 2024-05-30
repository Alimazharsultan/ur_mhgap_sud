import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/navigation_transition.dart';
import 'package:mhgap_urdu/screens/home_screen.dart';
import 'package:mhgap_urdu/utils/colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleText;
  final String subtitleText;
  final List<Widget>? actions;
  final VoidCallback? onLeadingPressed;

  const CustomAppBar({
    super.key,
    this.titleText = 'mhGAP',
    this.subtitleText = 'Intervention Guide (SUD Module)',
    this.actions,
    this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      leading: IconButton(
        icon: const Icon(Icons.home, color: followupHeadingColor),
        onPressed: () {
          navigateWithSlideTransition(context, HomeScreen());
        },
      ),
      title: Align(
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Text(
              titleText,
              style: const TextStyle(
                  color: headingColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
            Text(
              subtitleText,
              style: const TextStyle(
                color: headingColor,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
      actions: actions ??
          [
            IconButton(
              icon:
                  const Icon(Icons.menu, color: followupHeadingColor),
              onPressed: onLeadingPressed,
            ),
          ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

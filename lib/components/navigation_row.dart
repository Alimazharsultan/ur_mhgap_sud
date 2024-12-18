import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/divider_components.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/colors.dart';

class NavigationRow extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final String subText;
  final bool showBottomBar;
  final Color color;

  const NavigationRow({
    super.key,
    required this.title,
    required this.onPressed,
    this.subText = '',
    this.showBottomBar = true,
    this.color = bodyTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_left,
                    color: navigationBarColor, size: 40),
                onPressed: onPressed,
              ),
              Flexible(
                child: Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: BaseTextComponent(
                    text: title,
                    color: color,
                    fontSize: navigationRowTextSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          (subText.isEmpty)
              ? const SizedBox(height: 0)
              : Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: BaseTextComponent(
                    text: subText,
                    color: color,
                  ),
                ),
          (subText.isEmpty)
              ? const SizedBox(height: 0)
              : const SizedBox(height: 20),
          if (showBottomBar) const DividerLine()
        ],
      ),
    );
  }
}

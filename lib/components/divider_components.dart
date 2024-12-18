import 'package:flutter/material.dart';
import 'package:mhgap_urdu/utils/colors.dart';

class DividerLine extends StatelessWidget {
  const DividerLine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 10),
        Divider(color: navigationBarColor, height: 2),
        SizedBox(height: 10),
      ],
    );
  }
}

class HeadingDividerLine extends StatelessWidget {
  final bool addPadding;
  final Color color;

  const HeadingDividerLine({
    super.key,
    this.addPadding = false,
    this.color = headingDividerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: addPadding ? 20 : 0, vertical: 10),
        child: Divider(color: color, height: 5));
  }
}

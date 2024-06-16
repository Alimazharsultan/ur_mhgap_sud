import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/text_components.dart';
import 'package:mhgap_urdu/utils/colors.dart';

class ListBulletPoints extends StatelessWidget {
  final List bulletPoints;
  final bool isRedText;
  final double topMargin;
  final bool addHorizontalPadding;

  const ListBulletPoints({
    super.key,
    required this.bulletPoints,
    this.isRedText = false,
    this.topMargin = 15,
    this.addHorizontalPadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: bulletPoints
            .map((point) => BulletPoint(
                text: point,
                color: isRedText ? emergencyTextColor : bodyTextColor,
                topMargin: topMargin,
                horizontalPadding: addHorizontalPadding ? 30 : 0,
                fontSize: normalTextSize))
            .toList());
  }
}

class BulletPoint extends StatelessWidget {
  final String text;
  final double bulletSize;
  final double fontSize;
  final double topMargin;
  final Color color;
  final double horizontalPadding;
  final double verticalPadding;

  const BulletPoint({
    super.key,
    required this.text,
    this.topMargin = 20,
    this.bulletSize = 5.0,
    this.fontSize = normalTextSize,
    this.color = bodyTextColor,
    this.horizontalPadding = 30,
    this.verticalPadding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding, vertical: verticalPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: BaseTextComponent(
            text: text,
            color: color,
            fontSize: fontSize,
          )),
          Container(
            height: bulletSize,
            width: bulletSize,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(left: 8, top: topMargin),
          ),
        ],
      ),
    );
  }
}

class ArrowBulletPoint extends StatelessWidget {
  final String boldText;
  final String normalText;
  final Color arrowColor;
  final double verticalPadding;

  const ArrowBulletPoint({
    super.key,
    this.boldText = "",
    required this.normalText,
    this.arrowColor = emergencyTextColor,
    this.verticalPadding = 10,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: DescriptionText(
          boldText: boldText,
          normalText: normalText,
          arrowColor: arrowColor,
          horizontalPadding: 30,
          verticalPadding: verticalPadding,
          showArrow: true),
    );
  }
}

class EmergencyBulletPoints extends StatelessWidget {
  final String boldText;
  final String normalText;
  final double bulletSize;

  const EmergencyBulletPoints({
    super.key,
    required this.boldText,
    required this.normalText,
    this.bulletSize = 5.0, // Default size of bullet
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: DescriptionText(
                  boldText: boldText,
                  normalText: normalText,
                  horizontalPadding: 0,
                  fontSize: normalTextSize,
                  lineHeight: 3),
            ),
            Container(
              height: bulletSize,
              width: bulletSize,
              decoration: const BoxDecoration(
                color: navigationBarColor,
                shape: BoxShape.rectangle,
              ),
              margin: const EdgeInsets.only(
                  left: 8, top: 22), // Space between bullet and text
            ),
          ],
        ));
  }
}

class ListNumberPoints extends StatelessWidget {
  final List<String> numberPoints;
  final double horizontalPadding;

  const ListNumberPoints({
    super.key,
    required this.numberPoints,
    this.horizontalPadding = 30,
  });

  @override
  Widget build(BuildContext context) {
    List<String> urduNumerals = [
      '١',
      '٢',
      '٣',
      '٤',
      '٥',
      '٦',
      '٧',
      '٨',
      '٩',
      '١٠'
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: horizontalPadding),  
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: numberPoints.asMap().entries.map((entry) {
          int idx = entry.key;
          String text = entry.value;
          String urduNumber = urduNumerals[idx];
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: NumberPoint(
              text: text,
              numberString: '.$urduNumber',
              isBoldText: false,
            ),
          );
        }).toList(),
      ),
    );
  }
}

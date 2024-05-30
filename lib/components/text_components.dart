import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/divider_components.dart';
import 'package:mhgap_urdu/utils/colors.dart';

const double titleTextSize = 18; //blue color title with a bar below
const double subTitleTextSize = 17; //black color title below the title
const double subHeadingTextSize = 18; // right side heading text bold
const double normalTextSize =
    14; // normal information, bullet points, number points, orange navigation bar color
const double navigationRowTextSize = 15; // bold navigation bar text
const double boxTextSize = 12; // text inside the three buttons

const double numberPointsTextSize = 18;
const double warningTextSize = 22;

class BaseTextComponent extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final double height;
  final String fontFamily;

  const BaseTextComponent({
    super.key,
    required this.text,
    this.fontSize = normalTextSize,
    this.color = bodyTextColor,
    this.fontWeight = FontWeight.normal,
    this.textAlign = TextAlign.right,
    this.height = 2,
    this.fontFamily = "Nastaliq",
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textDirection: TextDirection.rtl,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}

class EnglishTextComponent extends StatelessWidget {
  final String text;
  final Color fontColor;

  const EnglishTextComponent({
    super.key,
    required this.text,
    this.fontColor = navigationBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: navigationBarColor, // Ensure navigationBarColor is defined
        fontSize: normalTextSize,
      ),
    );
  }
}

class NumberPoint extends StatelessWidget {
  final String text;
  final String numberString;
  final bool isBoldText;

  const NumberPoint({
    super.key,
    required this.text,
    this.numberString = '.1', // Default size of bullet
    this.isBoldText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: BaseTextComponent(
            text: text,
            color: bodyTextColor,
            fontWeight: (isBoldText) ? FontWeight.bold : FontWeight.normal,
            fontSize: normalTextSize,
            height: 2.5, // Line height
          ),
        ),
        Container(
          // height: bulletSize,
          // width: bulletSize,
          margin: const EdgeInsets.only(left: 8, top: 5),
          // height: bulletSize,
          // width: bulletSize,
          child: Text(
            numberString,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: numberPointsTextSize,
            ),
          ), // Space between bullet and text
        ),
      ],
    );
  }
}

class TitleText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final bool addHorizontalPadding;
  final bool showDividerLine;

  const TitleText({
    super.key,
    required this.text,
    this.color = headingColor,
    this.addHorizontalPadding = false,
    this.fontSize = titleTextSize,
    this.showDividerLine = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: 10.0,
          left: addHorizontalPadding ? 20 : 0,
          right: addHorizontalPadding ? 20 : 0),
      child: Column(
        children: [
          BaseTextComponent(
            text: text,
            fontSize: fontSize,
            color: color,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          if (showDividerLine) const HeadingDividerLine(),
        ],
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final bool isCenter;

  const HeadingText({
    super.key,
    required this.text,
    this.color = bodyTextColor,
    this.fontSize = subTitleTextSize,
    this.isCenter = false,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: (isCenter)
          ? AlignmentDirectional.center
          : AlignmentDirectional.centerEnd,
      child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
          child: BaseTextComponent(
            text: text,
            fontSize: fontSize,
            color: color,
            fontWeight: FontWeight.bold,
            textAlign: isCenter ? TextAlign.center : TextAlign.right,
          )),
    );
  }
}

class SubHeadingText extends StatelessWidget {
  final String text;
  final bool center;
  final bool addHorizontalPadding;
  final Color color;
  final double fontSize;

  const SubHeadingText({
    super.key,
    required this.text,
    this.center = false,
    this.addHorizontalPadding = false,
    this.color = bodyTextColor,
    this.fontSize = subHeadingTextSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (addHorizontalPadding) ? 20.0 : 0.0, vertical: 10),
        child: Align(
            alignment: (center)
                ? AlignmentDirectional.center
                : AlignmentDirectional.centerEnd,
            child: BaseTextComponent(
              text: text,
              fontSize: fontSize,
              color: color,
              fontWeight: FontWeight.bold,
              height: 2,
              textAlign: (center) ? TextAlign.center : TextAlign.right,
            )));
  }
}

class SubTitleText extends StatelessWidget {
  final String text;
  final bool center;
  final bool addPadding;
  final Color color;
  final bool underline;
  final double fontSize;

  const SubTitleText({
    super.key,
    required this.text,
    this.center = false,
    this.addPadding = false,
    this.color = bodyTextColor,
    this.underline = false,
    this.fontSize = subTitleTextSize,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            horizontal: (addPadding) ? 20.0 : 0.0, vertical: 10),
        child: Align(
          alignment: (center)
              ? AlignmentDirectional.center
              : AlignmentDirectional.centerEnd,
          child: BaseTextComponent(
            text: text,
            fontSize: fontSize,
            color: color,
            fontWeight: FontWeight.bold,
            height: 2,
            textAlign: (center) ? TextAlign.center : TextAlign.right,
          ),
        ));
  }
}

class InformationText extends StatelessWidget {
  final String text;
  final bool center;
  final double fontSize;
  final double horizontalPadding;

  const InformationText({
    super.key,
    required this.text,
    this.center = false,
    this.fontSize = normalTextSize,
    this.horizontalPadding = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
        padding: EdgeInsets.only(
            top: 10.0, left: horizontalPadding, right: horizontalPadding),
        child: BaseTextComponent(
          text: text,
          fontSize: fontSize,
          color: bodyTextColor,
          fontWeight: FontWeight.normal,
          textAlign: (center) ? TextAlign.center : TextAlign.right,
          height: 2,
        ),
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  final String boldText;
  final String normalText;
  final double horizontalPadding;
  final double verticalPadding;
  final double fontSize;
  final double lineHeight;
  final bool showArrow;
  final Color arrowColor;
  final String fontFamily;

  const DescriptionText(
      {super.key,
      this.boldText = "",
      required this.normalText,
      this.horizontalPadding = 0,
      this.verticalPadding = 0,
      this.fontSize = normalTextSize,
      this.lineHeight = 2,
      this.showArrow = false,
      this.arrowColor = emergencyTextColor,
      this.fontFamily = "Nastaliq"});

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding, vertical: verticalPadding),
          child: RichText(
            textDirection: TextDirection.rtl,
            text: TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: <TextSpan>[
                if (showArrow)
                  TextSpan(
                      text: '\u00BB ',
                      style: TextStyle(
                          color: arrowColor,
                          fontSize: 24,
                          fontFamily: "Jameel",
                          height: 1.0,
                          decoration: TextDecoration.none)),
                TextSpan(
                    text: boldText,
                    style: TextStyle(
                        color: bodyTextColor,
                        fontSize: fontSize + 1,
                        fontWeight: FontWeight.bold,
                        fontFamily: fontFamily,
                        height: lineHeight,
                        decoration: TextDecoration.none)),
                TextSpan(
                    text: normalText,
                    style: TextStyle(
                        color: bodyTextColor,
                        fontSize: fontSize,
                        fontFamily: fontFamily,
                        fontWeight: FontWeight.w100,
                        height: lineHeight,
                        decoration: TextDecoration.none)),
              ],
            ),
          ),
        ));
  }
}

// class EmergencyTitleText extends StatelessWidget {
//   final String redText;
//   final String orangeText;

//   const EmergencyTitleText(
//       {super.key, required this.redText, required this.orangeText});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
//         child: Align(
//             alignment: AlignmentDirectional.center,
//             child: RichText(
//               textDirection: TextDirection.rtl,
//               textAlign: TextAlign.center,
//               text: TextSpan(
//                 style: DefaultTextStyle.of(context).style,
//                 children: <TextSpan>[
//                   TextSpan(
//                       text: redText,
//                       style: const TextStyle(
//                           color: emergencyTextColor,
//                           fontSize: titleTextSize + 2,
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'Nastaliq',
//                           height: 2,
//                           decoration: TextDecoration.none)),
//                   TextSpan(
//                       text: orangeText,
//                       style: const TextStyle(
//                           color: navigationBarColor,
//                           fontSize: titleTextSize + 2,
//                           fontFamily: 'Nastaliq',
//                           fontWeight: FontWeight.normal,
//                           height: 2,
//                           decoration: TextDecoration.none)),
//                 ],
//               ),
//             )));
//   }
// }

class EmergencyTitleText extends StatelessWidget {
  final String redText;
  final String orangeText;

  const EmergencyTitleText(
      {super.key, required this.redText, required this.orangeText});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BaseTextComponent(
              text: redText,
              fontSize: titleTextSize + 2,
              color: emergencyTextColor,
              fontWeight: FontWeight.bold,
              height: 2,
            ),
            BaseTextComponent(
              text: orangeText,
              fontSize: titleTextSize + 2,
              color: navigationBarColor,
              fontWeight: FontWeight.bold,
              height: 2,
              textAlign: TextAlign.right,
            ),
          ],
        ));
  }
}

class CautionText extends StatelessWidget {
  const CautionText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: BaseTextComponent(
            text: '! احتیاط ',
            color: emergencyTextColor,
            fontSize: warningTextSize,
            height: 2.5, // Line height
          )),
    );
  }
}

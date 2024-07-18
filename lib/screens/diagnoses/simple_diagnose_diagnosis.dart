import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/base_scaffold.dart';
import 'package:mhgap_urdu/components/bullet_points.dart';
import 'package:mhgap_urdu/components/next_button.dart';
import 'package:mhgap_urdu/utils/texts.dart';

class SimpleDiagnoseScreen extends StatelessWidget {
  final String text;
  final Widget screen;

  const SimpleDiagnoseScreen({
    super.key,
    required this.text,
    required this.screen,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: DiagnosisScreen.title,
      body: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 60),
                  child: CustomPaint(
                    painter: PointyContainerPainter(),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: ArrowBulletPoint(
                        boldText: text,
                        normalText: ""
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          NextButton(title: 'آگے بڑھیے', screen: screen),
        ],
      ),
    );
  }
}

class PointyContainerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color.fromRGBO(255, 121, 0, 0.2)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(40, 0)
      ..lineTo(0, size.height / 2)
      ..lineTo(40, size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

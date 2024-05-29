import 'package:flutter/material.dart';
import 'package:mhgap_urdu/components/text_components.dart';

class FlowchartPainter extends CustomPainter {
  get math => null;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill;
    // final arrowPaint = Paint()
    //   ..color = Colors.black
    //   ..strokeWidth = 2;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    // Draw rectangle first
    drawBox(canvas, paint, textPainter,
        "کیا شخص نشہ کے زیرِ اثر/ بے ہوش دکھائی دیتا ہے؟", 50, 70);

    // Draw circle overlapping the rectangle
    drawCircle(canvas, paint, textPainter, "1", 205, 60,
        fontSize: 20); // Adjust position to overlap

    // Draw orange line with rhombus at the end
    drawArrow(canvas, paint..color = Colors.orange, 205, 85, 205, 150);
    drawRhombus(canvas, paint, 205, 170);

    // Draw grey line with circle at the end
    drawArrow(canvas, paint..color = Colors.grey, 205, 85, 305, 150);
    drawCircle(canvas, paint..color = Colors.grey, textPainter, "NO", 305, 170);

    // Draw the text box at the right side
    drawTextBox(
        canvas,
        paint..color = Colors.grey[300]!,
        textPainter,
        "CLINICAL TIP\nSuspect sedative intoxication overdose in anyone with unexplained drowsiness and slow breathing.",
        325,
        150);
  }

  void drawCircle(Canvas canvas, Paint fillPaint, TextPainter textPainter,
      String text, double x, double y,
      {double fontSize = normalTextSize}) {
    const double radius = 25;
    const double strokeWidth = 2;

    // Define a paint for the stroke
    final strokePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final circleCenter = Offset(x, y);

    // Draw the stroke circle
    canvas.drawCircle(circleCenter, radius + strokeWidth / 2, strokePaint);

    // Draw the fill circle
    canvas.drawCircle(circleCenter, radius, fillPaint);

    // Draw text inside circle
    final textStyle = TextStyle(
        color: Colors.white, fontSize: fontSize, fontWeight: FontWeight.bold);
    textPainter.text = TextSpan(text: text, style: textStyle);
    textPainter.layout();
    textPainter.paint(canvas,
        circleCenter - Offset(textPainter.width / 2, textPainter.height / 2));
  }

  void drawRhombus(Canvas canvas, Paint paint, double x, double y) {
    const double size = 40;
    final path = Path();
    path.moveTo(x, y);
    path.lineTo(x - size / 2, y + size / 2);
    path.lineTo(x, y + size);
    path.lineTo(x + size / 2, y + size / 2);
    path.close();
    canvas.drawPath(path, paint);

    final textPainter = TextPainter(
      text: TextSpan(
        text: "YES",
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(
            x - textPainter.width / 2, y + size / 2 - textPainter.height / 2));
  }

  void drawBox(Canvas canvas, Paint paint, TextPainter textPainter, String text,
      double x, double y) {
    const double width = 300;
    const double height = 60;
    final rect = Rect.fromLTWH(x, y, width, height);
    canvas.drawRect(rect, paint);

    // Draw text
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
      fontFamily: 'Jameel',
    );

    textPainter.textAlign = TextAlign.center;
    textPainter.text = TextSpan(text: text, style: textStyle);
    textPainter.layout(minWidth: 0, maxWidth: width);
    textPainter.paint(
        canvas, Offset(x + 20, y + 5 + height / 2 - textPainter.height / 2));
  }

  void drawArrow(Canvas canvas, Paint paint, double startX, double startY,
      double endX, double endY) {
    final path = Path();
    path.moveTo(startX, startY);
    path.lineTo(endX, endY);

    final arrowSize = 10.0; // Arrow head size
    final angle = math.atan2(endY - startY, endX - startX);

    path.moveTo(endX, endY);
    path.lineTo(endX - arrowSize * math.cos(angle - math.pi / 6),
        endY - arrowSize * math.sin(angle - math.pi / 6));
    path.moveTo(endX, endY);
    path.lineTo(endX - arrowSize * math.cos(angle + math.pi / 6),
        endY - arrowSize * math.sin(angle + math.pi / 6));

    canvas.drawPath(path, paint);
  }

  void drawTextBox(Canvas canvas, Paint paint, TextPainter textPainter,
      String text, double x, double y) {
    const double width = 200;
    const double height = 100;
    final rect = Rect.fromLTWH(x, y, width, height);
    canvas.drawRect(rect, paint);

    // Draw text
    const textStyle = TextStyle(
      color: Colors.red,
      fontSize: 14,
      fontWeight: FontWeight.bold,
      fontFamily: 'Arial',
    );

    textPainter.text = TextSpan(text: text, style: textStyle);
    textPainter.layout(minWidth: 0, maxWidth: width);
    textPainter.paint(canvas, Offset(x + 10, y + 10));
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

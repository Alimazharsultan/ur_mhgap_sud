import 'package:flutter/material.dart';

class OctagonalBadgePainter extends CustomPainter {
  final String text;

  const OctagonalBadgePainter({this.text = ''});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 5;

    // Adjust these for finer control over the octagonal shape
    double edgeInset = 18; // Smaller value gives sharper angles
    double width = size.width;
    double height = size.height;

    var path = Path();
    path.moveTo(edgeInset, 0);
    path.lineTo(width - edgeInset, 0); // Top horizontal edge
    path.lineTo(width, height / 2); // Top-right diagonal
    // path.lineTo(width, height - edgeInset); // Right vertical edge
    path.lineTo(width - edgeInset, height); // Bottom-right diagonal
    path.lineTo(edgeInset, height); // Bottom horizontal edge
    // path.lineTo(0, height - edgeInset); // Bottom-left diagonal
    path.lineTo(0, height / 2); // Left vertical edge
    path.lineTo(edgeInset, 0); // Back to start (top-left diagonal)
    path.close();

    final trianglePaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    canvas.drawPath(path, trianglePaint);

    // Draw the filled triangle at the bottom
    var trianglePath = Path();
    double triangleBaseHeight = 20; // Adjust the size of the triangle
    double triangleWidth = 60; // Adjust the width of the triangle

    trianglePath.moveTo(width / 2 - triangleWidth / 2, height);
    trianglePath.lineTo(width / 2, height + triangleBaseHeight);
    trianglePath.lineTo(width / 2 + triangleWidth / 2, height);
    trianglePath.close();

    canvas.drawPath(trianglePath, paint); // Drawing the triangle

    // Text settings
    const textStyle = TextStyle(
      color: Colors.red,
      fontSize: 12,
      fontWeight: FontWeight.bold,
      fontFamily: 'Nastaliq',
    );

    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textAlign: TextAlign.center,
      textDirection: TextDirection.rtl,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: width - 20,
    );
    final xCenter = (width - textPainter.width) / 2;
    final yCenter = (height - textPainter.height) / 2;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

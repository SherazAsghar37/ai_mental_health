import 'package:flutter/material.dart';

class FilledArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.black
          ..strokeWidth = 1
          ..style = PaintingStyle.fill;

    final path =
        Path()
          ..moveTo(size.width * 0.2, size.height * 0)
          ..lineTo(size.width * 0.24, size.height * 0.25)
          ..quadraticBezierTo(
            size.width * 0.5,
            size.height * 0.75,
            size.width * 0.76,
            size.height * 0.25,
          )
          ..lineTo(size.width * 0.8, size.height * 0)
          ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

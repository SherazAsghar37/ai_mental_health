import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = Colors.black
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;

    final path =
        Path()
          ..moveTo(size.width * 0.2, size.height * 0)
          ..quadraticBezierTo(
            size.width * 0.5,
            size.height,
            size.width * 0.8,
            size.height * 0, // End point on the right
          );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

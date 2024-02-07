import 'package:flutter/material.dart';

class DottedLine extends StatelessWidget {
  final double? width;
  final double? height;
  final Color color;

  const DottedLine({
    required this.width,
    required this.height,
    required this.color,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: DottedLinePainter(color: color),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;

  const DottedLinePainter({
    required this.color,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.round;

    double dashWidth = 5.0;
    double dashSpace = 5.0;

    double startX = 0.0;
    double endX = size.width;

    double currentX = startX;

    while (currentX < endX) {
      canvas.drawLine(
          Offset(currentX, 0.0), Offset(currentX + dashWidth, 0.0), paint);
      currentX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

import 'package:flutter/material.dart';

class DottedDivederWidget extends StatelessWidget {
  const DottedDivederWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: DottedDivider(height: 1, color: Color(0x50979797)),
    );
  }
}

class DottedDivider extends StatelessWidget {
  final double height;
  final Color color;

  const DottedDivider({Key? key, this.height = 1.0, this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: CustomPaint(
        painter: DottedLinePainter(color: color),
      ),
    );
  }
}

class DottedLinePainter extends CustomPainter {
  final Color color;

  DottedLinePainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.height
      ..strokeCap = StrokeCap.round;

    //paint.strokeWidth = 6;

    const dashWidth = 5; // Расстояние между пунктирами

    const space = 5; // Длина пунктира
    double currentX = 0;
    bool draw = true;

    while (currentX < size.width) {
      if (draw) {
        canvas.drawLine(Offset(currentX, size.height / 2),
            Offset(currentX + space, size.height / 2), paint);
      }
      currentX += space + dashWidth;
      draw = !draw;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

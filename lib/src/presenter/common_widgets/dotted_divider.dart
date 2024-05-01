import 'package:flutter/material.dart';
import 'package:weather_forecast_app/src/presenter/theme/app_colors.dart';

class DottedDivederWidget extends StatelessWidget {
  const DottedDivederWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: DottedDivider(height: 1, color: AppColors.gray),
          ),
        ),
      ],
    );
  }
}

class DottedDivider extends StatelessWidget {
  final double height;
  final Color color;

  const DottedDivider({
    super.key,
    this.height = 1.0,
    this.color = Colors.grey,
  });

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
      ..strokeWidth = size.height / 2
      ..strokeCap = StrokeCap.round;

    const dashWidth = 3; // Расстояние между пунктирами

    const space = 6; // Длина пунктира
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

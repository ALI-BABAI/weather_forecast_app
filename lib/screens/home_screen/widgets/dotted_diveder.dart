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

// Divider(
//   // color: Color(
//   //     0x10979797), // цвет 979797 с заполнением 16процентов == 0x10979797
//   color: grayColor,
//   thickness: 2,
//   indent: 23,
//   endIndent: 21,
// ),

// Мой вариант реализации пунктирного разделителя:
// Center(
//   child: Text(
//     // Разделитель должен быть пунктирным...
//     'Р                                                       м',
//     style: TextStyle(
//         color: Color(0xFF0A0A22), //0x10979797
//         decoration: TextDecoration.underline,
//         decorationColor: whiteColor,
//         decorationThickness: 1,
//         fontSize: 20,
//         decorationStyle: TextDecorationStyle.dashed),
//   ),
// ),

// GPT
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

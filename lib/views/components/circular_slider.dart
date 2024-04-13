import 'dart:math';
import 'package:flutter/material.dart';
import '../../services/constants/svg_icon.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ButtonYoqish(),
    );
  }
}

//!+++++++++++++++++++++++++++++++++++++++++++++++++

class ButtonYoqish extends StatefulWidget {
  const ButtonYoqish({super.key});

  @override
  State<ButtonYoqish> createState() => _ButtonYoqishState();
}

class _ButtonYoqishState extends State<ButtonYoqish> {
  int volume = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF24272C),
        body: Center(
          child: CircularSlider(
            onAngleChanged: (double value) {},
          ),
        ));
  }
}

double radius = 95;
double strokeWidth = 30;

class CircularSlider extends StatefulWidget {
  final ValueChanged<double> onAngleChanged;

  const CircularSlider({
    Key? key,
    required this.onAngleChanged,
  }) : super(key: key);

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  Offset currentDragOffset = Offset.zero;

  double currentAngle = 1.5;

  double startAngle = 110 * pi / 180;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Size canvasSize = Size(screenSize.width, screenSize.width - 35);
    Offset center = canvasSize.center(Offset.zero);
    Offset knobPos = toPolar(center - Offset(strokeWidth, strokeWidth),
        currentAngle + startAngle, radius);
    Offset iconPos = toPolar(center, startAngle, radius - (strokeWidth / 2));

    return Stack(
      children: [
        CustomPaint(
          size: canvasSize,
          painter: SliderPainter(
            startAngle: startAngle,
            currentAngle: currentAngle,
          ),
        ),
        Positioned(
          left: knobPos.dx + 15.5,
          top: knobPos.dy - 31.5,
          child: GestureDetector(
            onPanStart: (details) {
              RenderBox getBox = context.findRenderObject() as RenderBox;
              currentDragOffset = getBox.globalToLocal(details.globalPosition);
            },
            onPanUpdate: (details) {
              RenderBox getBox = context.findRenderObject() as RenderBox;
              Offset localPosition =
                  getBox.globalToLocal(details.globalPosition);

              double angle = atan2(
                  localPosition.dy - center.dy, localPosition.dx - center.dx);

              currentAngle = normalizeAngle(angle - startAngle);
              widget.onAngleChanged(currentAngle);
              setState(() {});
            },
            child: SvgIcon.circular.copyWith(
              newHeight: 29,
              newWidth: 29,
            ),
          ),
        ),
        Positioned(
          left: iconPos.dx - 20,
          top: iconPos.dy - 47.5,
          child: SvgIcon.circular.copyWith(
            newHeight: 29,
            newWidth: 29,
          ),
        ),
      ],
    );
  }

  double calculateAngle(Offset touchPosition, Offset center) {
    double angle = (touchPosition - center).direction - startAngle;

    return normalizeAngle(angle);
  }
}

class SliderPainter extends CustomPainter {
  final double startAngle;
  final double currentAngle;

  SliderPainter({required this.startAngle, required this.currentAngle});

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    Rect rect = Rect.fromCircle(center: center, radius: radius);
    var rainbowPaint = Paint()
      ..shader = const SweepGradient(
          center: Alignment.center,
          transform: GradientRotation(3.14 / 1.79),
          stops: [
            0.2,
            0.4,
            0.6,
            0.8
          ],
          colors: [
            Colors.green,
            Colors.blue,
            Colors.blue,
            Colors.red,
          ]).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(rect, startAngle, currentAngle, false, rainbowPaint);
  }

  @override
  bool shouldRepaint(covariant SliderPainter oldDelegate) {
    return currentAngle != oldDelegate.currentAngle;
  }
}

const fullAngleInRadians = pi * 2;

double normalizeAngle(double angle) => normalize(angle, fullAngleInRadians);

Offset toPolar(Offset center, double radians, double radius) =>
    center + Offset.fromDirection(radians, radius);

double normalize(double value, double max) => (value % max + max) % max;

double toAngle(Offset position, Offset center) => (position - center).direction;

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
      home: const CircularSliderMiniYoqish(),
    );
  }
}

//!+++++++++++++++++++++++++++++++++++++++++++++++++

class CircularSliderMiniYoqish extends StatefulWidget {
  const CircularSliderMiniYoqish({super.key});

  @override
  State<CircularSliderMiniYoqish> createState() =>
      _CircularSliderMiniYoqishState();
}

class _CircularSliderMiniYoqishState extends State<CircularSliderMiniYoqish> {
  int volume = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF24272C),
        body: Center(
          child: CircularSliderMini(
            onAngleChanged: (angle) {
              volume = ((angle / (3.14 * 1.88)) * 100).toInt();
              setState(() {});
            },
            radius: 95,
            strokeWidth: 15,
          ),
        ));
  }
}

class CircularSliderMini extends StatefulWidget {
  final ValueChanged<double> onAngleChanged;
  final double radius;
  final double strokeWidth;

  const CircularSliderMini({
    Key? key,
    required this.onAngleChanged,
    required this.radius,
    required this.strokeWidth,
  }) : super(key: key);

  @override
  State<CircularSliderMini> createState() => _CircularSliderMiniState();
}

class _CircularSliderMiniState extends State<CircularSliderMini> {
  Offset currentDragOffset = Offset.zero;

  double currentAngle = 1.5;

  double startAngle = 110 * pi / 180;

  @override
  Widget build(BuildContext context) {
    Size canvasSize = Size.fromRadius(widget.radius * 1.3);
    Offset center = canvasSize.center(Offset.zero);

    Offset iconPos =
        toPolar(center, startAngle, widget.radius - (widget.strokeWidth / 2));

    // Iconni boshlanish burchagida joylashtirish
    return Stack(
      children: [
        CustomPaint(
          size: canvasSize,
          painter: _SliderPainter(
            startAngle: startAngle,
            currentAngle: currentAngle,
            radius: widget.radius,
            strokeWidth: widget.strokeWidth,
          ),
        ),
        Positioned(
          left: center.dx + widget.radius * cos(startAngle + currentAngle) - 10,
          top: center.dy + widget.radius * sin(startAngle + currentAngle) - 10,
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
              newHeight: 20,
              newWidth: 20,
            ),
          ),
        ),
        Positioned(
          left: iconPos.dx - 14,
          top: iconPos.dy + 0.5,
          child: SvgIcon.circular.copyWith(
            newHeight: 20,
            newWidth: 20,
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

class _SliderPainter extends CustomPainter {
  final double startAngle;
  final double currentAngle;
  final double radius;
  final double strokeWidth;

  _SliderPainter({
    required this.startAngle,
    required this.currentAngle,
    required this.radius,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    Rect rect = Rect.fromCircle(center: center, radius: radius);
    var rainbowPaint = Paint()
      ..shader = const SweepGradient(
          center: Alignment.center,
          transform: GradientRotation(3.14 / 1.8),
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
  bool shouldRepaint(covariant _SliderPainter oldDelegate) {
    return currentAngle != oldDelegate.currentAngle;
  }
}

const fullAngleInRadians = pi * 2;

double normalizeAngle(double angle) => normalize(angle, fullAngleInRadians);

Offset toPolar(Offset center, double radians, double radius) =>
    center + Offset.fromDirection(radians, radius);

double normalize(double value, double max) => (value % max + max) % max;

double toAngle(Offset position, Offset center) => (position - center).direction;

import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIconButtonPressed extends StatefulWidget {
  final AssetImage image;
  final void Function()? onPressed;

  const AppIconButtonPressed({
    Key? key,
    required this.image,
    required this.onPressed,
  }) : super(key: key);

  @override
  AppIconButtonPressedState createState() => AppIconButtonPressedState();
}

class AppIconButtonPressedState extends State<AppIconButtonPressed> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
        if (widget.onPressed != null) {
          widget.onPressed!();
        }
      },
      child: Container(
        height: 60,
        width: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: _isPressed
                ? [
                    const Color.fromRGBO(210, 67, 229, 200),
                    const Color.fromRGBO(157, 0, 255, 200),
                  ]
                : [
                    const Color(0xff5D5E5F),
                    const Color(0xff000000),
                  ],
          ),
        ),
        child: Container(
          width: 55,
          height: 55,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: _isPressed
                  ? [
                      const Color.fromRGBO(157, 0, 255, 200),
                      const Color.fromRGBO(210, 67, 229, 200),
                    ]
                  : [
                      const Color(0xff0C0D0E),
                      const Color(0xff3E434B),
                    ],
            ),
          ),
          child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: _isPressed
                    ? [
                        const Color.fromRGBO(157, 0, 255, 200),
                        const Color.fromRGBO(210, 67, 229, 200),
                      ]
                    : [
                        const Color(0xff0C0D0E),
                        const Color(0xff3E434B),
                      ],
              ),
            ),
            child: SizedBox(
              width: 25,
              height: 25,
              child: Image(
                image: widget.image,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomBarIcon extends StatelessWidget {
  final AssetImage image;
  final bool isActive;

  // void Function()? onPressed;

  const BottomBarIcon({
    super.key,
    required this.image,
    required this.isActive,
 
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CupertinoButton(
        onPressed: null,
        child: Stack(
          children: [
            isActive
                ? Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 20,
                            color: Color.fromARGB(255, 157, 0, 255),
                          )
                        ],
                      ),
                    ),
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Align(
                alignment: Alignment.center,
                child: Image(
                  color: isActive
                      ? const Color.fromARGB(255, 157, 0, 255)
                      : Colors.white,
                  image: image,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) => shapePath(size);

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RPSCustomPainterr extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path_0 = shapePath(size);
    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.black.withOpacity(0.50);
    paint0Fill.imageFilter = ImageFilter.blur(
      sigmaX: Shadow.convertRadiusToSigma(40),
      sigmaY: Shadow.convertRadiusToSigma(40),
    );


    final shadowPaint1 = Paint()
      ..blendMode = BlendMode.overlay
      ..colorFilter =
          ColorFilter.mode(Colors.white.withOpacity(0.22), BlendMode.overlay)
      ..imageFilter = ImageFilter.blur(
          sigmaX: Shadow.convertRadiusToSigma(3),
          sigmaY: Shadow.convertRadiusToSigma(3));

    canvas.drawPath(path_0.shift(const Offset(0.5, 0.2)), shadowPaint1);
   
    canvas.drawPath(path_0, paint0Fill);


    final shadowPaint2 = Paint()
      ..blendMode = BlendMode.overlay
      ..colorFilter = const ColorFilter.mode(Colors.white, BlendMode.overlay)
      ..imageFilter = ImageFilter.blur(
          sigmaX: Shadow.convertRadiusToSigma(21),
          sigmaY: Shadow.convertRadiusToSigma(21));
    canvas.drawPath(path_0.shift(const Offset(-3, -20)), shadowPaint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

Path shapePath(Size size) {
  Path path_0 = Path();
  path_0.moveTo(0, size.height * 0.4515833);
  path_0.cubicTo(
      0,
      size.height * 0.4086077,
      size.width * 0.003320077,
      size.height * 0.3672936,
      size.width * 0.009267051,
      size.height * 0.3362654);
  path_0.lineTo(size.width * 0.04192103, size.height * 0.1658974);
  path_0.cubicTo(size.width * 0.06223282, size.height * 0.05992192,
      size.width * 0.09031718, 0, size.width * 0.1196736, 0);
  path_0.lineTo(size.width * 0.3187897, 0);
  path_0.cubicTo(
      size.width * 0.3407769,
      0,
      size.width * 0.3622385,
      size.height * 0.03365282,
      size.width * 0.3802897,
      size.height * 0.09643564);
  path_0.lineTo(size.width * 0.4341077, size.height * 0.2836308);
  path_0.cubicTo(
      size.width * 0.4737154,
      size.height * 0.4213962,
      size.width * 0.5262846,
      size.height * 0.4213962,
      size.width * 0.5658923,
      size.height * 0.2836308);
  path_0.lineTo(size.width * 0.6197103, size.height * 0.09643564);
  path_0.cubicTo(size.width * 0.6377615, size.height * 0.03365269,
      size.width * 0.6592231, 0, size.width * 0.6812103, 0);
  path_0.lineTo(size.width * 0.8803256, 0);
  path_0.cubicTo(
      size.width * 0.9096821,
      0,
      size.width * 0.9377667,
      size.height * 0.05992192,
      size.width * 0.9580795,
      size.height * 0.1658974);
  path_0.lineTo(size.width * 0.9907333, size.height * 0.3362654);
  path_0.cubicTo(size.width * 0.9966795, size.height * 0.3672936, size.width,
      size.height * 0.4086077, size.width, size.height * 0.4515833);
  path_0.lineTo(size.width, size.height);
  path_0.lineTo(0, size.height);
  path_0.lineTo(0, size.height * 0.4515833);
  path_0.close();

  return path_0;
}

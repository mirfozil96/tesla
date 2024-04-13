import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tesla/services/constants/svg_icon.dart';

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

class ButtonYoqish extends StatefulWidget {
  const ButtonYoqish({super.key});
  @override
  State<ButtonYoqish> createState() => _ButtonYoqishState();
}

class _ButtonYoqishState extends State<ButtonYoqish> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF24272C),
        body: Center(
          child: Button(
            customicon: SvgIcon.snow.copyWith(
              newHeight: 30,
              newWidth: 30,
            ),
          ),
        ));
  }
}

//!+++++++++++++++++++++++++++++++++++++++++++++++++

class Button extends StatefulWidget {
  final Widget? widget;
  final SvgPicture customicon;
  const Button({
    super.key,
    this.widget,
    required this.customicon,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    SvgPicture iconWithColor = widget.customicon.copyWith(
      newColor: pressed ? const Color.fromARGB(255, 210, 67, 229) : null,
    );
    return Row(
      children: [
        CupertinoButton(
          onPressed: () {
            setState(() {
              pressed = !pressed;
            });
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: pressed
                  ? const Color(
                      0xFF232527)
                  : const Color(0xFF232527),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: const EdgeInsets.all(1.5),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: pressed
                      ? const Color(
                          0xff545659)
                      : const Color(0xff545659),
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: pressed
                        ? [
                            const Color.fromARGB(255, 46, 50, 53),
                            const Color.fromARGB(255, 24, 25, 25)
                          ]
                        : [
                            const Color.fromARGB(255, 46, 50, 53),
                            const Color.fromARGB(255, 24, 25, 25),
                          ],
                  ),
                ),
                child: Center(child: iconWithColor),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
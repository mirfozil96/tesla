import 'package:flutter/material.dart';

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
      home: const VerticalSliderMiniYoqish(),
    );
  }
}

class VerticalSliderMiniYoqish extends StatefulWidget {
  const VerticalSliderMiniYoqish({super.key});
  @override
  State<VerticalSliderMiniYoqish> createState() =>
      _VerticalSliderMiniYoqishState();
}

class _VerticalSliderMiniYoqishState extends State<VerticalSliderMiniYoqish> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFF24272C),
        body: Center(
          child: VerticalSliderMini(),
        ));
  }
}

//!+++++++++++++++++++++++++++++++++++++++++++++++++

class VerticalSliderMini extends StatefulWidget {
  const VerticalSliderMini({super.key});
  @override
  State<VerticalSliderMini> createState() => _VerticalSliderMiniState();
}

class _VerticalSliderMiniState extends State<VerticalSliderMini>
    with TickerProviderStateMixin {
  double sliderHeight = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: 15,
      height: 100,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: 7.5,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: const [0.5, 1],
                colors: [
                  const Color.fromARGB(255, 60, 60, 60).withOpacity(0.8),
                  const Color.fromARGB(255, 121, 121, 121).withOpacity(0.5),
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 7.5,
            height: sliderHeight,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 210, 67, 229), blurRadius: 10)
                ],
                gradient: const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromARGB(255, 210, 67, 229),
                      Color.fromARGB(255, 157, 0, 255)
                    ]),
                borderRadius: BorderRadius.circular(20)),
          ),
          MoveableWidget(
            func: (son) {
              if (son >= 0) {
                sliderHeight = son;
              }
              setState(() {});
            },
          ),
        ],
      ),
    ));
  }
}

class MoveableWidget extends StatefulWidget {
  final void Function(double size)? func;
  const MoveableWidget({this.func, super.key});
  @override
  MoveableWidgetState createState() => MoveableWidgetState();
}

class MoveableWidgetState extends State<MoveableWidget> {
  double _y = 0; 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _y -= details.delta.dy;
          if (_y < 0) _y = 0;
          if (_y > 100 - 27.5) _y = 100 - 27.5;
          widget.func!(_y); 
        });
      },
      child: Stack(
        children: [
          AnimatedPositioned(
            bottom: _y,
            duration: const Duration(milliseconds: 10),
            child: const KnobWidget(
              changeSize: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class KnobWidget extends StatelessWidget {
  final double changeSize;
  const KnobWidget({
    required this.changeSize,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 15 * changeSize, 
      height: 27.5 * changeSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25 * changeSize),
        color: const Color(0xFF212325),
        gradient: const LinearGradient(colors: [
          Color(0xFF2E3236),
          Color(0xFF141515),
        ]),
        border:
            Border.all(color: const Color(0xFF212325), width: 1 * changeSize),
      ),
      child: Center(
        child: Column(
          children: [
            const Spacer(),
            Container(
              width: 13 * changeSize,
              height: 3.75 * changeSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.56 * changeSize),
                color: const Color(0xFF272A2E),
                gradient: const LinearGradient(colors: [
                  Color(0xFF141515),
                  Color(0xFF2E3236),
                ]),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.37),
                    offset: Offset(5 * changeSize,
                        5 * changeSize), 
                    blurRadius: 10 * changeSize,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: const Color(0xFFFFFFFF).withOpacity(0.07),
                    offset: Offset(-5 * changeSize, -5 * changeSize),
                    blurRadius: 10 * changeSize,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2 * 2,
            ),
            Container(
              width: 13 * changeSize,
              height: 3.75 * changeSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1.56 * changeSize),
                color: const Color(0xFF272A2E),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF141515),
                    Color(0xFF2E3236),
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF000000).withOpacity(0.37),
                    offset: Offset(5 * changeSize, 5 * changeSize),
                    blurRadius: 10 * changeSize,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: const Color(0xFFFFFFFF).withOpacity(0.07),
                    offset: Offset(-5 * changeSize, -5 * changeSize),
                    blurRadius: 10 * changeSize,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

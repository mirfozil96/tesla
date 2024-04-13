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
      home: const HorizontalSliderYoqish(),
    );
  }
}

class HorizontalSliderYoqish extends StatefulWidget {
  const HorizontalSliderYoqish({super.key});
  @override
  State<HorizontalSliderYoqish> createState() => _HorizontalSliderYoqishState();
}

class _HorizontalSliderYoqishState extends State<HorizontalSliderYoqish> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFF24272C),
        body: Center(
          child: HorizontalSlider(),
        ));
  }
}

//!+++++++++++++++++++++++++++++++++++++++++++++++++
class HorizontalSlider extends StatefulWidget {
  const HorizontalSlider({super.key});
  @override
  State<HorizontalSlider> createState() => _HorizontalSliderState();
}

class _HorizontalSliderState extends State<HorizontalSlider>
    with TickerProviderStateMixin {
  double sliderWidth = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      height: 15,
      width: 190,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: 7.5,
            width: 189,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
         
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.5, 1],
                colors: [
                  const Color.fromARGB(255, 46, 46, 46)
                      .withOpacity(0.8),
                  const Color.fromARGB(255, 121, 121, 121)
                      .withOpacity(0.5), 
                ],
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: 7.5,
            width: sliderWidth,
            decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Color.fromARGB(255, 210, 67, 229), blurRadius: 10)
                ],
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 210, 67, 229),
                      Color.fromARGB(255, 157, 0, 255)
                    ]),
                borderRadius: BorderRadius.circular(20)),
          ),
          MoveableWidget(
            func: (son) {
              if (son >= 0) {
                sliderWidth = son;
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
  double _x = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          _x += details.delta.dx;
          widget.func!(_x);
        });
      },
      child: Stack(
        children: [
          AnimatedPositioned(
              left: _x < 0
                  ? 0
                  : _x > 190 - 27.5
                      ? 190 - 27.5
                      : _x,
              duration: const Duration(milliseconds: 100),
              child: const KnobWidget(
                changeSize: 1,
              )),
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
      width: 27.5 * changeSize,
      height: 15 * changeSize,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25 * changeSize),
        color: const Color(0xFF212325),
        gradient: const LinearGradient(colors: [
          Color(0xFF2E3236),
          Color(0xFF141515),
        ]),
        border: Border.all(color: const Color(0xFF212325), width: 1 * 5),
      ),
      child: Center(
        child: Row(
          children: [
            const Spacer(),
            Container(
              width: 3.75 * changeSize,
              height: 13 * changeSize,
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
                    offset: const Offset(10, 10),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: const Color(0xFFFFFFFF).withOpacity(0.07),
                    offset: const Offset(-10, -10),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 2 * 2,
            ),
            Container(
              width: 3.75 * changeSize,
              height: 13 * changeSize,
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
                    offset: const Offset(10, 10),
                    blurRadius: 20,
                    spreadRadius: 0,
                  ),
                  BoxShadow(
                    color: const Color(0xFFFFFFFF).withOpacity(0.07),
                    offset: const Offset(-10, -10),
                    blurRadius: 20,
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

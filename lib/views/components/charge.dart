import 'dart:ui' as ui;
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
      home: const ChargeYoqish(),
    );
  }
}

class ChargeYoqish extends StatefulWidget {
  const ChargeYoqish({super.key});

  @override
  State<ChargeYoqish> createState() => _ChargeYoqishState();
}

class _ChargeYoqishState extends State<ChargeYoqish> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFF24272C),
        body: Center(
          child: Charge(),
        ));
  }
}

//!+++++++++++++++++++++++++++++++++++++++++++++++++

class Charge extends StatefulWidget {
  const Charge({Key? key}) : super(key: key);

  @override
  State<Charge> createState() => _ChargeState();
}

class _ChargeState extends State<Charge> {
  int battery = 50;
  double currentValue = 0;
  bool setCharge = false;
  bool component = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentValue = battery / 100;
  }

  void _updateBatteryLevel(int change) {
    setState(() {
      battery += change;
      if (battery < 0) {
        battery = 0;
      } else if (battery > 100) {
        battery = 100;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24272C),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            text: "$battery",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w600)),
                        const TextSpan(
                            text: "%",
                            style: TextStyle(color: Colors.grey, fontSize: 26)),
                      ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: SizedBox(
                        height: 100,
                        width: 360,
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Container(
                                  height: 125,
                                  width: battery * 3.2,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        ui.Color.fromARGB(0, 157, 0, 255),
                                        ui.Color.fromARGB(50, 157, 0, 255),
                                        ui.Color.fromARGB(120, 157, 0, 255),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CustomPaint(
                              painter: BatteryIndicator(
                                sizeX: 320,
                                sizeY: 60,
                                batteryPercent: battery,
                              ),
                              size: const Size(270, 50),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 35,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 2,
                              height: 10,
                              color: Colors.white,
                            ),
                            Container(
                              width: 2,
                              height: 10,
                              color: Colors.white,
                            ),
                            Container(
                              width: 2,
                              height: 10,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "10%",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "50%",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "100%",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _updateBatteryLevel(-10);
                      },
                      child: const AnimatedAlign(
                        duration: Duration(milliseconds: 500),
                        alignment: Alignment.topLeft,
                        child: Icon(
                          Icons.arrow_left,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: 30,
                        padding: const EdgeInsets.only(left: 10),
                        child: Stack(
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1C1D20),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          // Light shadow on the top-left to simulate emboss effect
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.5),
                                            offset: const Offset(-4, -4),
                                            blurRadius: 8,
                                            spreadRadius: 1,
                                          ),
                                          // Dark shadow on the bottom-right to simulate emboss effect
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.8),
                                            offset: const Offset(4, 4),
                                            blurRadius: 8,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Positioned(
                                  child: SizedBox(
                                    height: 20,
                                    width: battery *
                                        0.01 *
                                        MediaQuery.of(context).size.width *
                                        0.65,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 157, 0, 255),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          // Light shadow on the top-left to simulate the emboss effect
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            offset: const Offset(-4, -4),
                                            blurRadius: 8,
                                            spreadRadius: 1,
                                          ),
                                          // Dark shadow on the bottom-right to simulate the emboss effect
                                          const BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(4, 4),
                                            blurRadius: 8,
                                            spreadRadius: 1,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        _updateBatteryLevel(10);
                      },
                      child: const AnimatedAlign(
                        duration: Duration(milliseconds: 500),
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.arrow_right,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BatteryIndicator extends CustomPainter {
  final double sizeX;
  final double sizeY;
  final int batteryPercent;

  BatteryIndicator(
      {required this.sizeX, required this.sizeY, required this.batteryPercent});

  @override
  void paint(Canvas canvas, Size size) {
    /// Main Box
    double dx = sizeX;
    double dy = sizeY;
    Paint paint2 = Paint()
      ..color = const Color.fromARGB(255, 157, 0, 255)
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 0);
    paint2.shader = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: const [0.3, 0.4, 0.7],
      colors: [
        const Color(0xffffffff).withOpacity(0.3),
        const Color.fromARGB(255, 125, 125, 125).withOpacity(0.3),
        const Color.fromARGB(255, 61, 61, 61)
      ],
    ).createShader(Offset.zero & const Size(270, 90));
    final mainBox = Path();
    mainBox.moveTo(10, 10);
    mainBox.lineTo(dx - 10, 10);
    mainBox.lineTo(dx, 30);
    mainBox.quadraticBezierTo(dx, dy, dx - 3, dy);
    mainBox.lineTo(0, dy);
    mainBox.lineTo(0, dy);
    mainBox.lineTo(0, 30);
    mainBox.close();
    canvas.drawPath(mainBox, paint2);
    double x = batteryPercent * sizeX / 100;
    size = const Size(160, 70);
    var rect = Offset.zero & size;
    Paint paint1 = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 0);
    paint1.shader = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.4, 0.5, 0.7],
      colors: [
        ui.Color.fromARGB(255, 157, 0, 255),
        ui.Color.fromARGB(255, 98, 0, 159),
        ui.Color.fromARGB(255, 126, 0, 204),
      ],
    ).createShader(rect);
    final battery = Path();
    battery.moveTo(10, 10);
    battery.lineTo(x - 10, 10);
    battery.lineTo(x * 1.0, 30);
    battery.lineTo(x * 1.0, dy);
    battery.lineTo(0, dy);
    battery.lineTo(0, 30);
    battery.close();
    canvas.drawPath(battery, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

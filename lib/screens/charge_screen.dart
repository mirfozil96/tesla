import 'dart:ui' as ui;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../services/constants/svg_icon.dart';
import '../views/components/top_button.dart';
class ChargerScreen extends StatefulWidget {
  static const id = "/charge_screen";
  const ChargerScreen({Key? key}) : super(key: key);

  @override
  State<ChargerScreen> createState() => _ChargerScreenState();
}

class _ChargerScreenState extends State<ChargerScreen> {
  int battery = 50;
  double currentValue = 0;
  bool setCharge = false;
  double height = 150;
  bool component = false;

  void func() async {
    height = (height == 150) ? 350 : 150;
    setState(() {});
    component
        ? Future.delayed(const Duration(milliseconds: 250))
        : await Future.delayed(const Duration(milliseconds: 250));
    component = !component;
    setState(() {});
  }

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
      appBar: AppBar(
        toolbarHeight: 90,
        leadingWidth: 110,
        leading: TopButton(
          customicon: SvgIcon.person.copyWith(
            newHeight: 30,
            newWidth: 30,
          ),
          onPressed: (bool pressed) {
            setState(() {});
          },
        ),
        backgroundColor: const Color(0xFF24272C),
        title: const Column(
          children: [
            Text(
              "  Cybertruck",
              style: TextStyle(
                color: ui.Color.fromARGB(255, 138, 138, 138),
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              "  Charging",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        actions: [
          TopButton(
            customicon: SvgIcon.settings.copyWith(
              newHeight: 35,
              newWidth: 35,
            ),
            onPressed: (bool pressed) {
              setState(() {});
            },
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: const ModelViewer(
                    src: 'assets/3d/cybertruck.glb',
                    ar: false,
                    autoRotate: true,
                    disableZoom: true,
                  ),
                ),

                // const Mini3d(
                //   filename: 'cybertruck.glb',
                // ),

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
                                  width: battery * 3.6,
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        ui.Color.fromARGB(0, 157, 0, 255),
                                        ui.Color.fromARGB(80, 157, 0, 255),
                                        ui.Color.fromARGB(120, 157, 0, 255),
                                        ui.Color.fromARGB(255, 157, 0, 255),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            CustomPaint(
                              painter: BatteryIndicator(
                                sizeX: 360,
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
                              color: const Color.fromARGB(255, 157, 0, 255),
                            ),
                            Container(
                              width: 2,
                              height: 10,
                              color: const Color.fromARGB(255, 157, 0, 255),
                            ),
                            Container(
                              width: 2,
                              height: 10,
                              color: const Color.fromARGB(255, 157, 0, 255),
                            ),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "0%",
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
                        width: MediaQuery.of(context).size.width * 0.75,
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
                                        0.75,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color(0xFF1C1D20),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          // Dark shadow on the bottom right
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            offset: const Offset(4, 4),
                                            blurRadius: 5,
                                            spreadRadius: 1,
                                          ),
                                          // Light shadow on the top left
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.2),
                                            offset: const Offset(-4, -4),
                                            blurRadius: 5,
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
                                        0.75,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 157, 0, 255),
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          // Light shadow on the top left to simulate emboss effect
                                          BoxShadow(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            offset: const Offset(-4, -4),
                                            blurRadius: 10,
                                            spreadRadius: 1,
                                          ),
                                          // Dark shadow on the bottom right to simulate emboss effect
                                          const BoxShadow(
                                            color: Colors.black,
                                            offset: Offset(4, 4),
                                            blurRadius: 10,
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
                const Text(
                  "Set Charge Limit",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                AnimatedContainer(
                  height: height,
                  width: MediaQuery.of(context).size.width,
                  duration: const Duration(milliseconds: 250),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF24272C),
                      borderRadius: BorderRadius.circular(40),
                      boxShadow: [
                        // Dark shadow on the bottom right to simulate emboss effect
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.9),
                          offset: const Offset(4, 4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                        // Light shadow on the top left to simulate emboss effect
                        BoxShadow(
                          color: const Color.fromRGBO(255, 255, 255, 0.25),
                          offset: const Offset(-4, -4),
                          blurRadius: 10,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 27),
                                child: Text(
                                  'Charging Overview',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ),
                              CustomButtonAppBar(
                                widget: height > 200
                                    ? const Icon(
                                        Icons.keyboard_arrow_up,
                                        size: 35,
                                        color: Color(0xFFEBEBF5),
                                      )
                                    : const Icon(
                                        Icons.keyboard_arrow_down,
                                        size: 35,
                                        color:
                                            ui.Color.fromARGB(255, 157, 0, 255),
                                      ),
                                onPressed: func,
                              ),
                            ],
                          ),
                          component
                              ? const SizedBox(
                                  height: 200,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Message(),
                                      ],
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
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
        const Color.fromARGB(255, 210, 209, 209).withOpacity(0.3),
        const Color.fromARGB(255, 91, 91, 91).withOpacity(0.3),
        const Color.fromARGB(255, 33, 33, 33)
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

class Message extends StatelessWidget {
  const Message({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 25, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cybertruck',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  Text(
                    'super charge',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Lithium battery',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                        TextSpan(
                            text: ' 3/4',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SvgIcon.locationCharge,
                  const Text(
                    '125 Km',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        height: 2),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cybertruck',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  Text(
                    'super charge',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Lithium battery',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                        TextSpan(
                            text: ' 3/4',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SvgIcon.locationCharge,
                  const Text(
                    '1.7 Km',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        height: 2),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cybertruck',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  Text(
                    'super charge',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Lithium battery',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                        TextSpan(
                            text: ' 3/4',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SvgIcon.locationCharge,
                  const Text(
                    '1.7 Km',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        height: 2),
                  )
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cybertruck',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  Text(
                    'super charge',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9)),
                  ),
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Lithium battery',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                        TextSpan(
                            text: ' 3/4',
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SvgIcon.locationCharge,
                  const Text(
                    '1.7 Km',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        height: 2),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomButtonAppBar extends StatelessWidget {
  final void Function()? onPressed;
  final Widget widget;

  const CustomButtonAppBar(
      {Key? key, required this.widget, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: const Color(0xFF232527),
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              offset: Offset(3, 3),
              blurRadius: 20,
              color: Color(0xFF13151A),
            ),
            BoxShadow(
              offset: Offset(-3, -3),
              blurRadius: 20,
              color: Color(0xff5D6167),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xff5D6167).withOpacity(0.0),
              const Color(0xff13151A).withOpacity(1),
            ],
          ),
        ),
        child: Container(
          height: 44,
          width: 44,
          decoration: BoxDecoration(
            color: const Color(0xFF232527),
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: [
                const Color(0xff545659).withOpacity(0.0),
                const Color(0xff232629).withOpacity(1),
              ],
            ),
          ),
          child: Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              border: Border.all(
                width: 1.8,
                color: const Color(0xFF232527),
              ),
              color: const Color(0xff545659),
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xff5D6167).withOpacity(0.0),
                  const Color(0xff13151A).withOpacity(1),
                ],
              ),
            ),
            child: Align(
              alignment: Alignment.center,
              child: widget,
            ),
          ),
        ),
      ),
    );
  }
}

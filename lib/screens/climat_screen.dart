import 'package:flutter/material.dart';
import 'package:tesla/services/constants/svg_icon.dart';
import '../views/components/button.dart';
import '../views/components/horizotnal_slider.dart';
import '../views/components/circular_slider.dart';
import '../views/components/top_button.dart';
import '../views/components/circle_slider_center.dart';

class ControlScreen extends StatefulWidget {
  static const id = "/climat_screen";

  const ControlScreen({super.key});

  @override
  State<ControlScreen> createState() => _ControlScreenState();
}

class _ControlScreenState extends State<ControlScreen> {
  int volume = 0;

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
                  color: Color.fromARGB(255, 138, 138, 138),
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
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(
                    children: [
                      const CircleSliderCenter(),
                      CircularSlider(
                        onAngleChanged: (angle) {
                          volume = ((angle / (3.14 * 1.88)) * 100).toInt();
                          setState(() {});
                        },
                      ),
                      Center(
                        child: Text(
                          "$volume ° C",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            ' AC ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF9d9fa6),
                            ),
                          ),
                          Button(
                            customicon: SvgIcon.snow.copyWith(
                              newHeight: 30,
                              newWidth: 30,
                            ),
                          ),
                          const HorizontalSlider(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Heat',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF9d9fa6),
                            ),
                          ),
                          Button(
                            customicon: SvgIcon.sun.copyWith(
                              newHeight: 30,
                              newWidth: 30,
                            ),
                          ),
                          const HorizontalSlider(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Fan ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF9d9fa6),
                            ),
                          ),
                          Button(
                            customicon: SvgIcon.control.copyWith(
                              newHeight: 30,
                              newWidth: 30,
                            ),
                          ),
                          const HorizontalSlider(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            ' AC ',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF9d9fa6),
                            ),
                          ),
                          Button(
                            customicon: SvgIcon.chaqmoq.copyWith(
                              newHeight: 30,
                              newWidth: 30,
                            ),
                          ),
                          const HorizontalSlider(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}

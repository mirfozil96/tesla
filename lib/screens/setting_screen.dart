import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:tesla/services/constants/svg_icon.dart';
import 'package:tesla/views/components/circular_slider_mini.dart';

import '../views/components/horizotnal_slider_mini.dart';
import '../views/components/top_button.dart';
import '../views/components/vertical_slider_mini.dart';
import '../views/components/circle_slider_center_mini.dart';

class SettingScreen extends StatefulWidget {
  static const id = "/setting_screen";

  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int climate = 0;

  bool isLockedDoor = true;
  bool isLockedDog = false;
  bool isLockedSecurity = true;
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
            setState(() {
              // Chap tugma bosilganda nima bo'lishini yozing
            });
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
      extendBody: true,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: const ModelViewer(
                  src: 'assets/3d/camaro_ss.glb',
                  ar: false,
                  autoRotate: true,
                  disableZoom: false,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF24272C),
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(-12, -12),
                      blurRadius: 20,
                      color: Color.fromRGBO(255, 255, 255, .04),
                    ),
                    BoxShadow(
                      offset: Offset(-20, -25),
                      blurRadius: 2,
                      color: Color.fromRGBO(0, 0, 0, .02),
                    ),
                    BoxShadow(
                      offset: Offset(10, 10),
                      blurRadius: 20,
                      color: Color.fromRGBO(0, 0, 0, .35),
                    ),
                    BoxShadow(
                      offset: Offset(-5, -10),
                      blurRadius: 16,
                      color: Color(0x0fffffff),
                    ),
                  ],
                ),
                child: GlassmorphicContainer(
                  width: 200,
                  height: 200,
                  borderRadius: 40,
                  blur: 20,
                  alignment: Alignment.bottomCenter,
                  border: 1,
                  linearGradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.grey.withOpacity(0.10),
                        Colors.grey.withOpacity(0.10),
                      ],
                      stops: const [
                        0.1,
                        1,
                      ]),
                  borderGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.center,
                    colors: [
                      const Color(0xFFffffff).withOpacity(0.2),
                      const Color((0xFF282A2F)),
                    ],
                  ),
                  child: Column(
                    children: [
                      Text("Climate",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withOpacity(0.8))),
                      Stack(
                        alignment: Alignment
                            .center, // Bu yerda o'rtasiga joylashish belgilanadi
                        children: [
                          const CircleSliderCenterMini(),
                          CircularSliderMini(
                            onAngleChanged: (angle) {
                              climate = ((angle / (3.14 * 1.88)) * 100).toInt();
                              setState(() {});
                            },
                            radius: 64,
                            strokeWidth: 22.5,
                          ),
                          Text(
                            "$climate °C",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF24272C),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(-10, -10),
                              blurRadius: 20,
                              color: Color.fromRGBO(255, 255, 255, .04),
                            ),
                            BoxShadow(
                              offset: Offset(-12, -12),
                              blurRadius: 2,
                              color: Color.fromRGBO(0, 0, 0, .02),
                            ),
                            BoxShadow(
                              offset: Offset(5, 10),
                              blurRadius: 20,
                              color: Color.fromRGBO(0, 0, 0, .35),
                            ),
                            BoxShadow(
                              offset: Offset(-5, -10),
                              blurRadius: 16,
                              color: Color(0x0fffffff),
                            ),
                          ],
                        ),
                        child: GlassmorphicContainer(
                          width: MediaQuery.of(context).size.width / 2.7,
                          height: 180,
                          borderRadius: 30,
                          blur: 20,
                          alignment: Alignment.bottomCenter,
                          border: 1,
                          linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.grey.withOpacity(0.10),
                                Colors.grey.withOpacity(0.10),
                              ],
                              stops: const [
                                0.1,
                                1,
                              ]),
                          borderGradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            colors: [
                              const Color(0xFFffffff).withOpacity(0.2),
                              const Color((0xFF282A2F)),
                            ],
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text("Sensors",
                                      style: TextStyle(
                                        fontSize: 15,
                                        //  fontSize: 12
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromARGB(
                                                153, 111, 111, 111)
                                            .withOpacity(0.8),
                                      )),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 10, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    VerticalSliderMini(),
                                    VerticalSliderMini(),
                                    VerticalSliderMini(),
                                    VerticalSliderMini(),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10, left: 5, right: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Sensity",
                                        style: TextStyle(
                                          fontSize: 6,
                                          //  fontSize: 12
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromARGB(
                                                  153, 197, 197, 197)
                                              .withOpacity(0.8),
                                        )),
                                    Text("Brakes",
                                        style: TextStyle(
                                          fontSize: 8,
                                          //  fontSize: 12
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromARGB(
                                                  153, 197, 197, 197)
                                              .withOpacity(0.8),
                                        )),
                                    Text("Engine",
                                        style: TextStyle(
                                          fontSize: 8,
                                          //  fontSize: 12
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromARGB(
                                                  153, 197, 197, 197)
                                              .withOpacity(0.8),
                                        )),
                                    Text("Tyres",
                                        style: TextStyle(
                                          fontSize: 8,
                                          //  fontSize: 12
                                          fontWeight: FontWeight.w400,
                                          color: const Color.fromARGB(
                                                  153, 197, 197, 197)
                                              .withOpacity(0.8),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFF24272C),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(-5, -5),
                              blurRadius: 20,
                              color: Color.fromRGBO(255, 255, 255, .04),
                            ),
                            BoxShadow(
                              offset: Offset(-12, -12),
                              blurRadius: 2,
                              color: Color.fromRGBO(0, 0, 0, .02),
                            ),
                            BoxShadow(
                              offset: Offset(10, 10),
                              blurRadius: 20,
                              color: Color.fromRGBO(0, 0, 0, .35),
                            ),
                            BoxShadow(
                              offset: Offset(-5, -10),
                              blurRadius: 16,
                              color: Color(0x0fffffff),
                            ),
                          ],
                        ),
                        child: GlassmorphicContainer(
                          width: MediaQuery.of(context).size.width / 2.7,
                          height: 60,
                          borderRadius: 17,
                          blur: 20,
                          alignment: Alignment.bottomCenter,
                          border: 1,
                          linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.grey.withOpacity(0.10),
                                Colors.grey.withOpacity(0.10),
                              ],
                              stops: const [
                                0.1,
                                1,
                              ]),
                          borderGradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            colors: [
                              const Color(0xFFffffff).withOpacity(0.2),
                              const Color((0xFF282A2F)),
                            ],
                          ),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Text("Sensors",
                                  style: TextStyle(
                                    fontSize: 15,
                                    //  fontSize: 12
                                    fontWeight: FontWeight.w600,
                                    color:
                                        const Color.fromARGB(153, 111, 111, 111)
                                            .withOpacity(0.8),
                                  )),
                              const HorizontalSliderMini(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF24272C),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(-4, -4),
                          blurRadius: 20,
                          color: Color.fromRGBO(255, 255, 255, .04),
                        ),
                        BoxShadow(
                          offset: Offset(-4, 4),
                          blurRadius: 2,
                          color: Color.fromRGBO(0, 0, 0, .02),
                        ),
                        BoxShadow(
                          offset: Offset(10, 20),
                          blurRadius: 20,
                          color: Color.fromRGBO(0, 0, 0, .35),
                        ),
                        BoxShadow(
                          offset: Offset(-5, -4),
                          blurRadius: 16,
                          color: Color(0x0fffffff),
                        ),
                      ],
                    ),
                    child: GlassmorphicContainer(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 260,
                      borderRadius: 40,
                      blur: 20,
                      alignment: Alignment.bottomCenter,
                      border: 1,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.grey.withOpacity(0.10),
                            Colors.grey.withOpacity(0.10),
                          ],
                          stops: const [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.center,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.2),
                          const Color((0xFF282A2F)),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const SizedBox(
                                  width: 20,
                                ),
                                Text("Security",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                        color: const Color.fromRGBO(
                                                255, 255, 255, 1)
                                            .withOpacity(0.8))),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                isLockedDoor
                                    ? SvgIcon.unlock.copyWith(
                                        newWidth: 22,
                                        newHeight: 22,
                                        newColor: Colors.white.withOpacity(0.5),
                                      )
                                    : SvgIcon.lockGreen.copyWith(
                                        newWidth: 22,
                                        newHeight: 22,
                                        newColor: const Color.fromARGB(
                                            255, 157, 0, 255),
                                      ),
                                isLockedDoor
                                    ? const Text(
                                        "Doors Unlocked",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 157, 0, 255),
                                        ),
                                      )
                                    : Text(
                                        "Doors Locked",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white.withOpacity(0.8),
                                        ),
                                      ),
                                Switch(
                                  value: isLockedDoor,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isLockedDoor = newValue;
                                    });
                                  },
                                  activeTrackColor:
                                      const Color.fromARGB(255, 157, 0, 255),
                                  activeColor: Colors.white.withOpacity(0.8),
                                  inactiveThumbColor:
                                      const Color.fromARGB(255, 157, 0, 255),
                                  inactiveTrackColor:
                                      Colors.white.withOpacity(0.8),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                isLockedDog
                                    ? SvgIcon.unlock.copyWith(
                                        newWidth: 22,
                                        newHeight: 22,
                                        newColor: Colors.white.withOpacity(0.5),
                                      )
                                    : SvgIcon.lockGreen.copyWith(
                                        newWidth: 22,
                                        newHeight: 22,
                                        newColor: const Color.fromARGB(
                                            255, 157, 0, 255),
                                      ),
                                isLockedDog
                                    ? const Text(
                                        "Dog Mode on",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 157, 0, 255),
                                        ),
                                      )
                                    : Text(
                                        "Dog Mode off",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white.withOpacity(0.8),
                                        ),
                                      ),
                                Switch(
                                  value: isLockedDog,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isLockedDog = newValue;
                                    });
                                  },
                                  activeTrackColor:
                                      const Color.fromARGB(255, 157, 0, 255),
                                  activeColor: Colors.white.withOpacity(0.8),
                                  inactiveThumbColor:
                                      const Color.fromARGB(255, 157, 0, 255),
                                  inactiveTrackColor:
                                      Colors.white.withOpacity(0.8),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                isLockedSecurity
                                    ? SvgIcon.unlock.copyWith(
                                        newWidth: 22,
                                        newHeight: 22,
                                        newColor: Colors.white.withOpacity(0.5),
                                      )
                                    : SvgIcon.lockGreen.copyWith(
                                        newWidth: 22,
                                        newHeight: 22,
                                        newColor: const Color.fromARGB(
                                            255, 157, 0, 255),
                                      ),
                                isLockedSecurity
                                    ? const Text(
                                        "Security mode on",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color:
                                              Color.fromARGB(255, 157, 0, 255),
                                        ),
                                      )
                                    : Text(
                                        "Security mode off",
                                        style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white.withOpacity(0.8),
                                        ),
                                      ),
                                Switch(
                                  value: isLockedSecurity,
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      isLockedSecurity = newValue;
                                    });
                                  },
                                  activeTrackColor:
                                      const Color.fromARGB(255, 157, 0, 255),
                                  activeColor: Colors.white.withOpacity(0.8),
                                  inactiveThumbColor:
                                      const Color.fromARGB(255, 157, 0, 255),
                                  inactiveTrackColor:
                                      Colors.white.withOpacity(0.8),
                                ),
                              ],
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
    );
  }
}

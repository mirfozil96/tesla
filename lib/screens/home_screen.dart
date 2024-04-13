import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:tesla/services/constants/svg_icon.dart';
import 'package:tesla/views/components/home_controller_panel.dart';
import '../views/components/top_button.dart';

class HomeScreen extends StatefulWidget {
  static const id = "/home_screen";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24272C),
      appBar: AppBar(
        // title: const SizedBox(
        //   height: 50,
        //   width: 50,
        //   child: ModelViewer(
        //     src: 'assets/3d/moon.glb',
        //     ar: false,
        //     autoRotate: true,
        //     disableZoom: false,
        //   ),
        // ),
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
      body: Center(
        child: Column(
          children: [
            const Column(
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
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: const ModelViewer(
                src: 'assets/3d/tesla_roadster_2020.glb',
                ar: false,
                autoRotate: true,
                disableZoom: false,
              ),
            ),

            //! tuzatish kerak
            // const Mini3d(
            //   filename: 'cybertruck.glb',
            // ),
            const ControlPanel(),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: GlassmorphicContainer(
                width: MediaQuery.of(context).size.width / 1.16,
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgIcon.shield.copyWith(
                                newWidth: 22,
                                newHeight: 22,
                                newColor: Colors.white.withOpacity(0.5),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  children: [
                                    Text("Security",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Colors.white.withOpacity(0.8))),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50.0),
                            child: SvgIcon.chevronRight.copyWith(
                              newWidth: 22,
                              newHeight: 22,
                              newColor: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgIcon.arrow.copyWith(
                                newWidth: 22,
                                newHeight: 22,
                                newColor: Colors.white.withOpacity(0.5),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Climate",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Colors.white.withOpacity(0.8))),
                                    Text("interior 15``C",
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
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50.0),
                            child: SvgIcon.chevronRight.copyWith(
                              newWidth: 22,
                              newHeight: 22,
                              newColor: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 7),
                              SvgIcon.charge.copyWith(
                                newWidth: 22,
                                newHeight: 22,
                                newColor: Colors.white.withOpacity(1),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Charging",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                            color:
                                                Colors.white.withOpacity(0.8))),
                                    Text("70 percent",
                                        style: TextStyle(
                                          fontSize: 15,
                                          //  fontSize: 12
                                          fontWeight: FontWeight.w600,
                                          color: const Color.fromARGB(
                                                  153, 135, 135, 135)
                                              .withOpacity(0.8),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 50.0),
                            child: SvgIcon.chevronRight.copyWith(
                              newWidth: 22,
                              newHeight: 22,
                              newColor: Colors.white.withOpacity(0.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

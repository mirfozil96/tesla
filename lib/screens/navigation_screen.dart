import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import '../views/components/navigator_buttons.dart';

import 'charge_screen.dart';
import 'climat_screen.dart';
import 'home_screen.dart';
import 'setting_screen.dart';
import 'tesla_3d_screen.dart';

class NavigatorScreen extends StatefulWidget {
  static const id = "/navigation_screen";
  const NavigatorScreen({Key? key}) : super(key: key);

  @override
  State<NavigatorScreen> createState() => _NavigatorScreenState();
}

class _NavigatorScreenState extends State<NavigatorScreen> {
  int selectedIndex = 0; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24272C),
      bottomNavigationBar: ClipPath(
        clipper: MyClipper(),
        child: CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 10),
          painter: RPSCustomPainterr(),
          child: SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {

                    setState(() {
                      selectedIndex = 0;
                    });
                    debugPrint("selectedCar");
                  },
                  child: BottomBarIcon(
                    image: const AssetImage("assets/icons/ic_car.png"),
                    isActive: selectedIndex == 0,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 1;
                    });
                    debugPrint("selectedLightning");
                  },
                  child: BottomBarIcon(
                    image: const AssetImage("assets/icons/arrow.png"),
                    isActive: selectedIndex == 1,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 2;
                    });
                  },
                  child: BottomBarIcon(
                    image: const AssetImage("assets/icons/ic_lightning.png"),
                    isActive: selectedIndex == 2,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = 3;
                    });
                  },
                  child: BottomBarIcon(
                    image: const AssetImage("assets/icons/ic_person.png"),
                    isActive: selectedIndex == 3,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {},
          shape: const CircleBorder(),
          child: AppIconButtonPressed(
            image: const AssetImage("assets/icons/plus.png"),
            onPressed: () {
              setState(() {
                selectedIndex = 4;
              });
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      body: _getBody(selectedIndex),
    );
  }


  Widget _getBody(int index) {
    switch (index) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ControlScreen();
      case 2:
        return const ChargerScreen();
      case 3:
        return const SettingScreen();
      case 4:
        return const ModelScreen3d();
      default:
        return Container(); 
    }
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      home: const CunstomControlPanelyoqish(),
    );
  }
}

//!+++++++++++++++++++++++++++++++++++++++++++++++++

class CunstomControlPanelyoqish extends StatefulWidget {
  const CunstomControlPanelyoqish({super.key});
  @override
  State<CunstomControlPanelyoqish> createState() =>
      _CunstomControlPanelyoqishState();
}

class _CunstomControlPanelyoqishState extends State<CunstomControlPanelyoqish> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFF24272C),
        body: Center(
          child: ControlPanel(),
        ));
  }
}

class ControlPanel extends StatefulWidget {
  const ControlPanel({super.key});

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  bool pressedLock = true;
  bool pressedLight = false;
  bool pressedFan = true;
  bool pressedBagg = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330,
      height: 75,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 33, 35, 39),
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 20,
            color: Color.fromRGBO(255, 255, 255, .04),
          ),
          BoxShadow(
            offset: Offset(-15, -15),
            blurRadius: 2,
            color: Color.fromRGBO(0, 0, 0, .02),
          ),
          BoxShadow(
            offset: Offset(-1, 20),
            blurRadius: 20,
            color: Color.fromRGBO(0, 0, 0, .35),
          ),
          BoxShadow(
            offset: Offset(-10, -10),
            blurRadius: 16,
            color: Color(0x0fffffff),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CupertinoButton(
            child: SvgIcon.lock.copyWith(
              newColor: pressedLock
                  ? const Color.fromARGB(255, 210, 67, 229)
                  : Colors.white,
            ),
            onPressed: () {
              setState(() {
                pressedLock = !pressedLock;
              });
            },
          ),
          CupertinoButton(
            child: SvgIcon.charge.copyWith(
                newColor: pressedLight
                    ? const Color.fromARGB(255, 210, 67, 229)
                    : Colors.white),
            onPressed: () {
              setState(() {
                pressedLight = !pressedLight;
              });
            },
          ),
          CupertinoButton(
            child: SvgIcon.vent.copyWith(
                newColor: pressedFan
                    ? const Color.fromARGB(255, 210, 67, 229)
                    : Colors.white),
            onPressed: () {
              setState(() {
                pressedFan = !pressedFan;
              });
            },
          ),
          CupertinoButton(
            child: SvgIcon.car_1.copyWith(
                newColor: pressedBagg
                    ? const Color.fromARGB(255, 210, 67, 229)
                    : Colors.white),
            onPressed: () {
              setState(() {
                pressedBagg = !pressedBagg;
              });
            },
          ),
        ],
      ),
    );
  }
}

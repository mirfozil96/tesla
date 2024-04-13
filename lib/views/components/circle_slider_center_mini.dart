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
      home: const HorizontalSliderMiniYoqish(),
    );
  }
}

class HorizontalSliderMiniYoqish extends StatefulWidget {
  const HorizontalSliderMiniYoqish({super.key});
  @override
  State<HorizontalSliderMiniYoqish> createState() =>
      _HorizontalSliderMiniYoqishState();
}

class _HorizontalSliderMiniYoqishState
    extends State<HorizontalSliderMiniYoqish> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Color(0xFF24272C),
        body: Center(
          child: CircleSliderCenterMini(),
        ));
  }
}

//!+++++++++++++++++++++++++++++++++++++++++++++++++

class CircleSliderCenterMini extends StatelessWidget {
  const CircleSliderCenterMini({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 130,
        width: 130,
        decoration: const BoxDecoration(
          color: Color(0xFF292D31),
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
          
              blurRadius: 50,
              color: Color(0xff3a4145),
            ),
            BoxShadow(
              offset: Offset(10, 10),
              blurRadius: 20,
              color: Color(0xFF13151A),
            ),
          ],
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff2B2F33),
              Color(0xff101113),
            ],
          ),
        ),
        child: Center(
          child: ClipOval(
            child: Container(
              width: 90,
              height: 90,
              decoration: const BoxDecoration(
                color: Color(0xFF292D31),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(20, 20),
                    blurRadius: 40,
                    color: Color(0xFF13151A),
                  ),
                  BoxShadow(
                    offset: Offset(-2, -2),
                    blurRadius: 10,
                    color: Color(0xff282c2f),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff1d1f22),
                    Color(0xff323840),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

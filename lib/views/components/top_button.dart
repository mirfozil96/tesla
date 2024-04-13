import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      home: const TopButtonYoqish(),
    );
  }
}

class TopButtonYoqish extends StatefulWidget {
  const TopButtonYoqish({super.key});

  @override
  State<TopButtonYoqish> createState() => _TopButtonYoqishState();
}

class _TopButtonYoqishState extends State<TopButtonYoqish> {
  bool isPageTwoShown = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF24272C),
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: const Color(0xFF24272C),
        title: const Text(
          '        One',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white, 
          ),
        ),
        leadingWidth: 100,
        leading: TopButton(
          customicon: SvgIcon.person.copyWith(
            newHeight: 25,
            newWidth: 25,
          ),
          onPressed: (bool pressed) {
            setState(() {
        
            });
          },
        ),
        actions: [
          TopButton(
            customicon: SvgIcon.settings.copyWith(
              newHeight: 30,
              newWidth: 30,
            ),
            onPressed: (bool pressed) {
              setState(() {
                isPageTwoShown = !isPageTwoShown;
              });
            },
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: isPageTwoShown ? const PageTwo() : const PageOne(),
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF24272C),
      body: Center(
        child: Text(
          'One',
          style: TextStyle(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white, 
          ),
        ),
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF24272C),
      body: Center(
        child: Text(
          'Two',
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

//!+++++++++++++++++++++++++++++++++++++++++++++++++

class TopButton extends StatefulWidget {
  final SvgPicture customicon;
  final ValueChanged<bool> onPressed;

  const TopButton({
    Key? key,
    required this.customicon,
    required this.onPressed,
  }) : super(key: key);

  @override
  TopButtonState createState() => TopButtonState();
}

class TopButtonState extends State<TopButton> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    SvgPicture iconWithColor = widget.customicon.copyWith(
      newColor: pressed ? const Color.fromARGB(255, 210, 67, 229) : null,
    );

    return CupertinoButton(
      onPressed: () {
        setState(() {
          pressed = !pressed;
          widget.onPressed(pressed);
        });
      },
      padding: EdgeInsets.zero,
      child: Container(
        height: 62,
        width: 62,
        decoration: BoxDecoration(
          color: const Color(0xFF232527),
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              offset: Offset(6, 6),
              blurRadius: 20,
              color: Color(0xFF13151A),
            ),
            BoxShadow(
              offset: Offset(-6, -6),
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
          height: 50,
          width: 50,
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
          child: Padding(
            padding: const EdgeInsets.all(1.5),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 1.8, color: const Color(0xFF232527)),
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
              child: Center(child: iconWithColor),
            ),
          ),
        ),
      ),
    );
  }
}

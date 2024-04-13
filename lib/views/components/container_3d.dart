// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

// void main() {
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         useMaterial3: true,
//       ),
//       home: const ModelScreen3d(),
//     );
//   }
// }

// SizedBox(
//   height: 200,
//   width: MediaQuery.of(context).size.width,
//   child: const ModelViewer(
//     src: 'assets/3d/cybertruck.glb',
//     ar: false,
//     autoRotate: true,
//     disableZoom: false,
//   ),
// ),
//!++++++++++++++++++++++++++++++++++++++++
class Mini3d extends StatefulWidget {
  final String filename;
  const Mini3d({
    Key? key,
    required this.filename,
  }) : super(key: key);

  @override
  State<Mini3d> createState() => _Mini3dState();
}

class _Mini3dState extends State<Mini3d> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 200,
        width: 200,
        child: ModelViewer(
          backgroundColor: Colors.transparent,
          src: 'assets/3d/${widget.filename}',
          ar: false,
          autoRotate: true,
          disableZoom: false,
        ),
      ),
    );
  }
}

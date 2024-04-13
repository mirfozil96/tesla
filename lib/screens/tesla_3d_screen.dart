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

//!++++++++++++++++++++++++++++++++++++++++

class ModelScreen3d extends StatefulWidget {
  static const id = "/tesla_3d_screen";

  const ModelScreen3d({super.key});

  @override
  State<ModelScreen3d> createState() => _ModelScreen3dState();
}

class _ModelScreen3dState extends State<ModelScreen3d> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF24272C),
      body: ModelViewer(
        backgroundColor: Color(0xFF24272C),
        src: 'assets/3d/lamborghini_sian_roadster_realistic_free.glb',
        alt: 'A 3D model of an astronaut',
        ar: false,
        autoRotate: true,
        disableZoom: false,
      ),
    );
  }
}

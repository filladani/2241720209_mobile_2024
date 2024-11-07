import 'package:flutter/material.dart';
import 'screens/camera_screen.dart'; // Import halaman CameraScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CameraScreen(), // Halaman utama untuk pengambilan foto
      debugShowCheckedModeBanner: false,
    );
  }
}

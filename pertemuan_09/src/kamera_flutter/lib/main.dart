import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'widget/takepicture_screen.dart';

Future<void> main() async {
  // Pastikan plugin kamera terinisialisasi sebelum runApp() dipanggil.
  WidgetsFlutterBinding.ensureInitialized();

  // Dapatkan daftar kamera yang tersedia pada perangkat.
  final cameras = await availableCameras();

  // Pilih kamera pertama dari daftar kamera yang tersedia.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      home: TakePictureScreen(
        // Pass kamera pertama yang ditemukan ke widget TakePictureScreen.
        camera: firstCamera,
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:pertemuan_09/widget/displaypicture_screen.dart'; // Pastikan import DisplayPictureScreen

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;

  const TakePictureScreen({super.key, required this.camera});

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // Inisialisasi CameraController
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose controller saat widget dihapus
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // Pastikan kamera sudah terinisialisasi
            await _initializeControllerFuture;

            // Ambil gambar menggunakan camera controller
            final image = await _controller.takePicture();

            // Pastikan widget masih aktif sebelum navigasi
            if (!context.mounted) return;

            // Navigasi ke halaman DisplayPictureScreen dan tampilkan gambar
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DisplayPictureScreen(
                  imagePath: image.path, // Path gambar yang diambil
                ),
              ),
            );
          } catch (e) {
            // Tangani error jika terjadi masalah saat mengambil gambar
            print(e);
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

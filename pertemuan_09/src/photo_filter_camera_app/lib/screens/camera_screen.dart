import 'dart:io';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'photo_filter_carousel.dart'; // Import halaman filter carousel

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late List<CameraDescription> _cameras;
  late CameraDescription _camera;

  bool _isCameraInitialized = false;
  late XFile _imageFile;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  // Menginisialisasi kamera
  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _camera = _cameras.first; // Pilih kamera pertama
    _controller = CameraController(_camera, ResolutionPreset.high);
    await _controller.initialize();
    setState(() {
      _isCameraInitialized = true;
    });
  }

  // Fungsi untuk mengambil gambar
  Future<void> _takePicture() async {
    if (!_controller.value.isInitialized) {
      return;
    }

    final directory = await getApplicationDocumentsDirectory();
    final imagePath = path.join(directory.path, '${DateTime.now()}.png');
    _imageFile = await _controller.takePicture();

    // Setelah gambar diambil, arahkan ke halaman PhotoFilterCarousel untuk menerapkan filter
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhotoFilterCarousel(
          imagePath: _imageFile.path, // Kirim path gambar yang diambil
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take a Picture'),
        backgroundColor: Colors.black,
      ),
      body: _isCameraInitialized
          ? FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: CameraPreview(_controller),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
      floatingActionButton: FloatingActionButton(
        onPressed: _takePicture,
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

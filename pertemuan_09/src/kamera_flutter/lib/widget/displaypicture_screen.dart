import 'package:flutter/material.dart';
import 'dart:io';

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('2241720209'), // Ganti dengan NIM Anda
      ),
      // Menampilkan gambar yang diambil dari file
      body: Center(
        child: Image.file(
          File(imagePath),
          fit: BoxFit.cover, // Agar gambar menyesuaikan tampilan
        ),
      ),
    );
  }
}

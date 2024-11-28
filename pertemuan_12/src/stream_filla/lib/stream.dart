import 'dart:async';
import 'package:flutter/material.dart';

class ColorStream {
  final StreamController<Color> _streamController = StreamController<Color>();

  // Daftar warna
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.teal,
    Colors.lightBlueAccent, 
    Colors.orange,          
    Colors.yellow,          
    Colors.red,             
    Colors.green,           
  ];

  // Getter untuk stream
  Stream<Color> get stream => _streamController.stream;

  // Function untuk menambahkan warna baru ke stream
  void addColor(Color color) {
    _streamController.add(color);
  }

  // Function untuk menambahkan warna secara berurutan
  void addColorsSequentially() async {
    for (Color color in colors) {
      await Future.delayed(const Duration(seconds: 1)); // Delay 1 detik
      addColor(color);
    }
  }

  // Function untuk menutup stream
  void dispose() {
    _streamController.close();
  }
}

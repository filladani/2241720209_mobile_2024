import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ViewportOffset;
import 'widget/filter_carousel.dart'; // Import file widget filter_carousel.dart

void main() {
  runApp(
    const MaterialApp(
      home: PhotoFilterCarousel(), // Menampilkan widget PhotoFilterCarousel di halaman utama
      debugShowCheckedModeBanner: false, // Menonaktifkan banner debug
    ),
  );
}

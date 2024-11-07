import 'package:flutter/material.dart';

@immutable
class FilterItem extends StatelessWidget {
  const FilterItem({
    super.key,
    required this.color,
    this.onFilterSelected,
  });

  final Color color;
  final VoidCallback? onFilterSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onFilterSelected, // Memanggil callback saat diketuk
      child: AspectRatio(
        aspectRatio: 1.0, // Membuat rasio aspek 1:1 untuk bentuk persegi
        child: Padding(
          padding: const EdgeInsets.all(8), // Memberikan padding di sekitar gambar
          child: ClipOval( // Memotong gambar menjadi bentuk oval (lingkaran)
            child: Image.network(
              'https://docs.flutter.dev/cookbook/img-files/effects/instagram-buttons/millennial-texture.jpg', // URL gambar
              color: color.withOpacity(0.5), // Menerapkan warna dengan opasitas 50%
              colorBlendMode: BlendMode.hardLight, // Mengatur cara pencampuran warna dengan gambar
            ),
          ),
        ),
      ),
    );
  }
}

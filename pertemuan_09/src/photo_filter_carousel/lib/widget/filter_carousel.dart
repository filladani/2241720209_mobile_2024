import 'package:flutter/material.dart';
import 'filter_selector.dart'; // Pastikan untuk mengimpor widget FilterSelector

@immutable
class PhotoFilterCarousel extends StatefulWidget {
  const PhotoFilterCarousel({super.key});

  @override
  State<PhotoFilterCarousel> createState() => _PhotoFilterCarouselState();
}

class _PhotoFilterCarouselState extends State<PhotoFilterCarousel> {
  // Daftar filter warna yang akan digunakan dalam carousel
  final _filters = [
    Colors.white, // Filter default (no color)
    ...List.generate(
      Colors.primaries.length,
      (index) => Colors.primaries[(index * 4) % Colors.primaries.length],
    )
  ];

  // ValueNotifier untuk melacak warna filter yang dipilih
  final _filterColor = ValueNotifier<Color>(Colors.white);

  // Fungsi untuk menangani perubahan filter
  void _onFilterChanged(Color value) {
    _filterColor.value = value;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      child: Stack(
        children: [
          // Gambar dengan filter yang diterapkan
          Positioned.fill(
            child: _buildPhotoWithFilter(),
          ),
          // FilterSelector di bagian bawah
          Positioned(
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: _buildFilterSelector(),
          ),
        ],
      ),
    );
  }

  // Widget untuk menampilkan gambar dengan filter yang diterapkan
  Widget _buildPhotoWithFilter() {
    return ValueListenableBuilder(
      valueListenable: _filterColor,
      builder: (context, color, child) {
        // Ganti dengan foto pilihan Anda sendiri jika diperlukan
        return Image.network(
          'https://docs.flutter.dev/cookbook/img-files'
          '/effects/instagram-buttons/millennial-dude.jpg',
          color: color.withOpacity(0.5), // Terapkan filter dengan transparansi
          colorBlendMode: BlendMode.color, // Gunakan BlendMode untuk filter warna
          fit: BoxFit.cover,
        );
      },
    );
  }

  // Widget untuk menampilkan selector filter
  Widget _buildFilterSelector() {
    return FilterSelector(
      onFilterChanged: _onFilterChanged, // Callback untuk perubahan filter
      filters: _filters, // Daftar filter yang akan digunakan
    );
  }
}

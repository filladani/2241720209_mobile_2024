import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CarouselFlowDelegate extends FlowDelegate {
  CarouselFlowDelegate({
    required this.viewportOffset,
    required this.filtersPerScreen,
  }) : super(repaint: viewportOffset);

  final ViewportOffset viewportOffset;
  final int filtersPerScreen;

  @override
  void paintChildren(FlowPaintingContext context) {
    final count = context.childCount;

    // Semua lebar yang tersedia untuk menggambar
    final size = context.size.width;

    // Ukuran setiap item dalam carousel (dipecah berdasarkan jumlah item per layar)
    final itemExtent = size / filtersPerScreen;

    // Posisi scroll saat ini yang dihitung dalam satuan item, misalnya: 0.0, 1.0, 1.3, 2.9, dll.
    final active = viewportOffset.pixels / itemExtent;

    // Indeks item pertama yang perlu digambar
    final min = math.max(0, active.floor() - 3).toInt();

    // Indeks item terakhir yang perlu digambar
    final max = math.min(count - 1, active.ceil() + 3).toInt();

    // Menghasilkan transformasi untuk item yang terlihat dan mengurutkan berdasarkan jarak
    for (var index = min; index <= max; index++) {
      // Menghitung posisi X setiap item relatif terhadap item yang aktif
      final itemXFromCenter = itemExtent * index - viewportOffset.pixels;

      // Menghitung persentase seberapa dekat item tersebut dengan item tengah
      final percentFromCenter = 1.0 - (itemXFromCenter / (size / 2)).abs();

      // Menghitung skala item (lebih besar di tengah, lebih kecil di tepi)
      final itemScale = 0.5 + (percentFromCenter * 0.5);

      // Menghitung opasitas item (lebih terang di tengah, lebih transparan di tepi)
      final opacity = 0.25 + (percentFromCenter * 0.75);

      // Matriks transformasi untuk memindahkan dan mengubah ukuran item
      final itemTransform = Matrix4.identity()
        ..translate((size - itemExtent) / 2) // Menempatkan item pada posisi horizontal tengah
        ..translate(itemXFromCenter) // Posisi horizontal item
        ..translate(itemExtent / 2, itemExtent / 2) // Pusatkan item
        ..multiply(Matrix4.diagonal3Values(itemScale, itemScale, 1.0)) // Skalakan item
        ..translate(-itemExtent / 2, -itemExtent / 2); // Kembali ke posisi awal

      // Menggambar item dengan transformasi dan opacity yang dihitung
      context.paintChild(
        index,
        transform: itemTransform,
        opacity: opacity,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CarouselFlowDelegate oldDelegate) {
    return oldDelegate.viewportOffset != viewportOffset; // Periksa apakah viewportOffset berubah
  }
}

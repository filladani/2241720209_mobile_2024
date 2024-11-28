import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:async';  // Mengimpor pustaka dart:async untuk bekerja dengan StreamController dan Sinks


class NumberStream {
  // Membuat StreamController untuk mengontrol stream yang berisi angka bertipe int
  final StreamController<int> controller = StreamController<int>();

  // Properti sink untuk menambahkan data ke dalam stream
  Sink<int> get sink => controller.sink;

  // Properti stream untuk mendengarkan data yang dikirimkan melalui stream
  Stream<int> get stream => controller.stream;

  // Method untuk menghasilkan angka secara berurutan dan mengirimkannya melalui stream
  void generateNumbers() async {
    for (int i = 0; i < 10; i++) {
      await Future.delayed(Duration(seconds: 1)); // Delay 1 detik
      sink.add(i); // Menambahkan angka ke dalam stream
    }
    close(); // Menutup controller setelah selesai
  }

  // Method untuk menambahkan angka baru ke dalam sink
  void addNumberToSink(int newNumber) {
    controller.sink.add(newNumber); // Menambahkan angka ke dalam sink (stream)
  }

  // Method untuk menutup StreamController
  void close() {
    controller.close(); // Menutup controller
  }
}

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

  // Method untuk menghasilkan warna sebagai stream (menggunakan generator)
  Stream<Color> getColors() async* {
    // Perulangan manual dengan jeda
    for (Color color in colors) {
      await Future.delayed(const Duration(seconds: 1)); // Delay 1 detik
      yield color; // Kirim warna ke stream
    }

    // Menggunakan yield* dengan Stream.periodic
    yield* Stream.periodic(
      const Duration(seconds: 1),
      (int t) {
        int index = t % colors.length; // Index berulang
        return colors[index]; // Warna berdasarkan index
      },
    );
  }

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

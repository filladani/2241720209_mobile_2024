import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'stream.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Filla',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, // Warna tema biru muda
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  int lastNumber = 0; // Angka terakhir yang diterima
  late StreamController numberStreamController; // Kontrol Stream
  late NumberStream numberStream; // Objek NumberStream

  @override
  void initState() {
    super.initState();

    // Inisialisasi NumberStream dan StreamController
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    // Listener untuk memperbarui lastNumber
    Stream stream = numberStreamController.stream;
    stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });
  }

  @override
  void dispose() {
    // Menutup StreamController saat widget dihapus
    numberStreamController.close();
    super.dispose();
  }

  void addRandomNumber() {
    // Generate angka acak dan tambahkan ke sink
    Random random = Random();
    int myNum = random.nextInt(10); // Angka acak antara 0-9
    numberStream.addNumberToSink(myNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Filla'), // Nama panggilan dalam judul
      ),
      body: SizedBox(
        width: double.infinity, // Memanfaatkan lebar penuh layar
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Ruang antar elemen
          crossAxisAlignment: CrossAxisAlignment.center, // Elemen di tengah horizontal
          children: [
            Text(
              lastNumber.toString(), // Menampilkan angka terakhir
              style: const TextStyle(
                fontSize: 32, // Ukuran teks besar
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue, // Warna teks
              ),
            ),
            ElevatedButton(
              onPressed: () => addRandomNumber(), // Panggil addRandomNumber saat tombol ditekan
              child: const Text('New Random Number'), // Label tombol
            ),
          ],
        ),
      ),
    );
  }
}

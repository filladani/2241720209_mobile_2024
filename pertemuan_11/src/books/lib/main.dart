import 'package:flutter/material.dart';
import 'package:async/async.dart'; // Mengimpor package async untuk FutureGroup
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}

class FuturePage extends StatefulWidget {
  const FuturePage({super.key});

  @override
  State<FuturePage> createState() => _FuturePageState();
}

class _FuturePageState extends State<FuturePage> {
  String result = ''; // Untuk menyimpan hasil

  // Method async yang menunggu selama 3 detik
  Future<int> returnOneAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 1;
  }

  Future<int> returnTwoAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 2;
  }

  Future<int> returnThreeAsync() async {
    await Future.delayed(const Duration(seconds: 3));
    return 3;
  }

  // Method baru untuk menggunakan FutureGroup
  void returnFG() {
    // Membuat FutureGroup untuk menyimpan Future yang akan diproses
    FutureGroup<int> futureGroup = FutureGroup<int>();

    // Menambahkan Future yang ingin dijalankan secara paralel
    futureGroup.add(returnOneAsync());
    futureGroup.add(returnTwoAsync());
    futureGroup.add(returnThreeAsync());

    // Menutup FutureGroup, ini berarti kita sudah menambahkan semua Future
    futureGroup.close();

    // Setelah semua Future selesai, hasilnya akan diproses
    futureGroup.future.then((List<int> value) {
      // Menghitung total hasil dari ketiga Future
      int total = 0;
      for (var element in value) {
        total += element;
      }

      // Update UI dengan hasil perhitungan
      setState(() {
        result = total.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future Group Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              // Mengubah onPressed untuk memanggil returnFG
              onPressed: () {
                returnFG(); // Memanggil returnFG ketika tombol ditekan
              },
              child: const Text('GO!'),
            ),
            const SizedBox(height: 20),
            Text('Result: $result', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}

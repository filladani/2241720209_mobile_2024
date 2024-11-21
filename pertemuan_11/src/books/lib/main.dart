import 'dart:async';
import 'package:async/async.dart'; // Import untuk menggunakan Completer
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Completer Demo - Filla',
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
  String result = ''; // Variabel untuk menyimpan hasil
  late Completer<int> completer; // Variabel late Completer

  Future<int> getNumber() {
    completer = Completer<int>(); // Membuat instance Completer
    calculate(); // Memulai perhitungan
    return completer.future; // Mengembalikan Future dari Completer
  }

  Future<void> calculate() async {
    await Future.delayed(
        const Duration(seconds: 5)); // Simulasi proses selama 5 detik
    completer.complete(42); // Menyelesaikan Future dengan nilai 42
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Completer Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                getNumber().then((value) {
                  setState(() {
                    result = value.toString(); // Menampilkan hasil ke UI
                  });
                });
              },
              child: const Text('Get Number'),
            ),
            const SizedBox(height: 20),
            Text(
              result,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

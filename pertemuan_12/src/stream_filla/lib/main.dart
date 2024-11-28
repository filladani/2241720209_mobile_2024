import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'stream.dart'; // pastikan untuk mengimpor stream.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  int lastNumber = 0;
  late StreamController<int> numberStreamController;
  late NumberStream numberStream;

  @override
  void initState() {
    super.initState();
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    // Mengambil stream dan menambahkan listener
    Stream<int> stream = numberStreamController.stream;

    // Mendengarkan stream dan menangani data serta error
    stream.listen(
      (event) {
        setState(() {
          lastNumber = event; // Menangani data
        });
      },
      onError: (error) {
        setState(() {
          lastNumber = -1; // Menangani error
        });
      },
    );
  }

  // Method untuk menambah angka acak ke sink
  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10); // Membuat angka acak
    numberStream.addNumberToSink(myNum); // Menambah angka acak ke sink
    // Men-trigger error di-comment untuk praktikum selanjutnya
    // numberStream.addError(); 
  }

  @override
  void dispose() {
    numberStreamController.close(); // Menutup stream controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Example'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(lastNumber.toString()), // Menampilkan angka terakhir
            ElevatedButton(
              onPressed: addRandomNumber, // Menambah angka acak ke sink
              child: const Text('New Random Number'),
            ),
            ElevatedButton(
              onPressed: numberStream.addError, // Men-trigger error
              child: const Text('Trigger Error'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}

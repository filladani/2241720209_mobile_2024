import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'stream.dart';

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  late NumberStream numberStream;
  late StreamController numberStreamController;
  late StreamSubscription subscription;

  int lastNumber = 0;

  @override
  void initState() {
    super.initState();

    // Inisialisasi NumberStream dan StreamController
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;

    // Mendapatkan Stream dan menambahkan listener
    Stream stream = numberStreamController.stream;
    subscription = stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    });

    // Menambahkan onError untuk menangani error dari stream
    subscription.onError((error) {
      setState(() {
        lastNumber = -1; // Tampilkan nilai -1 jika terjadi error
      });
    });

    // Menambahkan onDone untuk menangani ketika stream selesai
    subscription.onDone(() {
      print('OnDone was called');
    });
  }

  @override
  void dispose() {
    // Membatalkan subscription untuk mencegah kebocoran memori
    subscription.cancel();
    super.dispose();
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    if (!numberStreamController.isClosed) {
      // Menambahkan angka acak ke stream jika stream masih terbuka
      numberStream.addNumberToSink(myNum);
    } else {
      // Jika stream sudah ditutup, set nilai lastNumber menjadi -1
      setState(() {
        lastNumber = -1;
      });
    }
  }

  void stopStream() {
    // Menutup StreamController untuk menghentikan pengiriman event
    numberStreamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Events with Stop'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(lastNumber.toString()), // Menampilkan nilai terakhir dari stream
            ElevatedButton(
              onPressed: addRandomNumber, // Menambahkan angka acak ke stream
              child: const Text('New Random Number'),
            ),
            ElevatedButton(
              onPressed: stopStream, // Menutup stream subscription
              child: const Text('Stop Subscription'),
            ),
          ],
        ),
      ),
    );
  }
}

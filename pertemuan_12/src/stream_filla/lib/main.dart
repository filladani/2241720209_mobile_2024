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
  }

  @override
  void dispose() {
    // Membatalkan subscription untuk menghindari memory leaks
    subscription.cancel();
    numberStreamController.close();
    super.dispose();
  }

  void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    numberStream.addNumberToSink(myNum);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Events Subscription'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(lastNumber.toString()),
            ElevatedButton(
              onPressed: addRandomNumber,
              child: const Text('New Random Number'),
            ),
          ],
        ),
      ),
    );
  }
}

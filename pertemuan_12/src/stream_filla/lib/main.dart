import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Filla', // Tambahkan nama panggilan
      theme: ThemeData(
        primarySwatch: Colors.lightBlue, // Ganti warna tema ke biru muda
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream Home Page'),
      ),
      body: Center(
        child: Container(
          child: const Text('Welcome to Stream Home Page!'),
        ),
      ),
    );
  }
}

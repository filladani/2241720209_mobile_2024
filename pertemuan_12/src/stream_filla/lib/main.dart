import 'package:flutter/material.dart';
import 'stream.dart';  // Mengimpor file stream.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream Filla',  // Menampilkan nama aplikasi
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,  // Menggunakan tema biru muda
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
  Color bgColor = Colors.blueGrey;  // Warna latar belakang default
  late ColorStream colorStream;  // Objek ColorStream untuk streaming warna

  // Override initState() untuk inisialisasi objek dan mulai mendengarkan stream
  @override
  void initState() {
    super.initState();  // Panggil initState() dari superclass
    colorStream = ColorStream();  // Inisialisasi objek ColorStream
    changeColor();  // Mulai mendengarkan stream warna dengan changeColor()
  }

  // Menggunakan listen() untuk mendengarkan stream
  void changeColor() {
    colorStream.getColors().listen((eventColor) {
      setState(() {
        bgColor = eventColor;  // Mengubah warna latar belakang dengan warna baru dari stream
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),  // Judul aplikasi
      ),
      body: Container(
        decoration: BoxDecoration(
          color: bgColor,  // Mengubah warna latar belakang sesuai stream
        ),
        child: Center(
          child: Text(
            'Streaming Color!',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

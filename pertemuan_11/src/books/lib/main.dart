import 'package:flutter/material.dart';
import 'geolocation.dart'; // Mengimpor file geolocation.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
      title: 'Geolocation App by Filla',
      theme: ThemeData(primarySwatch: Colors.blue),
      home:
          const LocationScreen(), // Panggil LocationScreen sebagai layar utama
    );
  }
}

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Future Demo - Filla', // Tambahkan nama panggilan
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
  String result = ''; // Menyimpan hasil pengambilan data
  bool isLoading = false; // Untuk mengontrol tampilan loading

  /// Method untuk mengambil data dari API Google Books
  Future<http.Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/EEr3DQAAQBAJ';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }

  /// Method untuk memulai pengambilan data dan memperbarui UI
  void fetchData() async {
    setState(() {
      isLoading = true; // Menampilkan animasi loading
    });

    try {
      http.Response response = await getData();
      if (response.statusCode == 200) {
        setState(() {
          result = response.body; // Menampilkan hasil respons
        });
      } else {
        setState(() {
          result = 'Error: ${response.statusCode}'; // Menampilkan error
        });
      }
    } catch (e) {
      setState(() {
        result = 'Error: $e'; // Menangkap kesalahan
      });
    } finally {
      setState(() {
        isLoading = false; // Sembunyikan animasi loading
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back from the Future'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('GO!'),
              onPressed: fetchData, // Panggil method fetchData
            ),
            const SizedBox(height: 20),
            if (isLoading) ...[
              const CircularProgressIndicator(), // Animasi loading
            ] else ...[
              Text(
                result,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Error Handling Demo',
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
  String result = '';

  // Method yang dapat melempar error
  Future returnError() async {
    await Future.delayed(const Duration(seconds: 2));
    throw Exception('Something terrible happened!');
  }

  // Menangani error menggunakan try-catch-finally
  Future handleError() async {
    try {
      await returnError(); // Memanggil method yang dapat melempar error
    } catch (error) {
      setState(() {
        result = error.toString(); // Menampilkan pesan error
      });
    } finally {
      print('Complete'); // Menampilkan 'Complete' ke konsol
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error Handling Example')),
      body: Center(
        child: Column(
          children: [
            const Spacer(),
            ElevatedButton(
              child: const Text('Trigger Error'),
              onPressed: () {
                handleError(); // Memanggil method handleError saat tombol ditekan
              },
            ),
            const Spacer(),
            Text(result), // Menampilkan hasil error atau pesan
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

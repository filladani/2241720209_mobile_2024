import 'package:flutter/material.dart';
import 'navigation_dialog.dart'; // Impor file navigation_dialog.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Dialog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavigationDialogScreen(), // Set layar awal aplikasi
    );
  }
}

import 'package:flutter/material.dart';
import 'navigation_second.dart';  // Pastikan Anda membuat file navigation_second.dart

class NavigationFirst extends StatefulWidget {
  const NavigationFirst({super.key});

  @override
  State<NavigationFirst> createState() => _NavigationFirstState();
}

class _NavigationFirstState extends State<NavigationFirst> {
  Color color = Colors.lightBlue; // Warna favorit Anda

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation First Screen - Filla'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Change Color'),
          onPressed: () {
            _navigateAndGetColor(context);
          },
        ),
      ),
    );
  }

  Future<void> _navigateAndGetColor(BuildContext context) async {
    // Melakukan navigasi ke screen kedua dan mendapatkan nilai warna yang dipilih
    color = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NavigationSecond()), // Navigasi ke NavigationSecond
    ) ?? Colors.blue; // Jika tidak ada warna yang dipilih, set warna default biru
    setState(() {}); // Memperbarui tampilan dengan warna yang baru
  }
}

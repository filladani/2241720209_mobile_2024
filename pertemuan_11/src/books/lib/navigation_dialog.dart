import 'package:flutter/material.dart';

class NavigationDialogScreen extends StatefulWidget {
  const NavigationDialogScreen({super.key});

  @override
  State<NavigationDialogScreen> createState() => _NavigationDialogScreenState();
}

class _NavigationDialogScreenState extends State<NavigationDialogScreen> {
  // Warna default latar belakang
  Color color = Colors.blue.shade700;

  // Method untuk menampilkan dialog dengan async
  Future<void> _showColorDialog(BuildContext context) async {
    final Color? selectedColor = await showDialog<Color>(
      context: context,
      barrierDismissible: false, // Dialog tidak bisa ditutup sembarangan
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Very Important Question'),
          content: const Text('Please choose a color'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context, const Color.fromARGB(255, 255, 53, 238));
              },
              child: const Text('Purple'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, const Color.fromARGB(255, 248, 255, 51));
              },
              child: const Text('Yellow'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, Colors.blue.shade700);
              },
              child: const Text('Blue'),
            ),
          ],
        );
      },
    );

    // Perbarui warna berdasarkan pilihan
    if (selectedColor != null) {
      setState(() {
        color = selectedColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        title: const Text('Navigation Dialog Screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _showColorDialog(context), // Panggil dialog saat tombol ditekan
          child: const Text('Change Color'),
        ),
      ),
    );
  }
}

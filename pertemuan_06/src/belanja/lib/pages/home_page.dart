import 'package:flutter/material.dart';
import '../models/item.dart'; // Sesuaikan dengan path model item kamu

class HomePage extends StatelessWidget {
  // Daftar item yang ditampilkan
  final List<Item> items = [
    Item(
      name: 'Sugar',
      price: 5000,
      imageUrl: 'assets/images/gula.jpg', // Path lokal untuk gambar
      stock: 100,
      rating: 4.5,
    ),
    Item(
      name: 'Salt',
      price: 2000,
      imageUrl: 'assets/images/garam.jpg', // Path lokal untuk gambar
      stock: 50,
      rating: 4.0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            child: Column(
              children: [
                Image.asset(
                  item.imageUrl,
                  fit: BoxFit.cover,
                  height: 100, // Sesuaikan tinggi gambar
                  width: double.infinity, // Lebar penuh
                ),
                Text(item.name),
                Text('Price: ${item.price}'), // Pastikan tidak ada simbol $
                Text('Stock: ${item.stock}'),
                Text('Rating: ${item.rating}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

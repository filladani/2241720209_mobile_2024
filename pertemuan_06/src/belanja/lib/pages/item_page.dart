import 'package:flutter/material.dart';
import '../models/item.dart'; // Sesuaikan path jika perlu

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(itemArgs.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(itemArgs.imageUrl), // Menampilkan gambar produk
            Text('Price: ${itemArgs.price.toStringAsFixed(2)}'),
            Text('Stock: ${itemArgs.stock}'),
            Text('Rating: ${itemArgs.rating} ⭐'),
          ],
        ),
      ),
    );
  }
}

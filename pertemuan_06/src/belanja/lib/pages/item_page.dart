// import 'package:flutter/material.dart';
// import '../models/item.dart'; // Sesuaikan path jika perlu

// class ItemPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final itemArgs = ModalRoute.of(context)!.settings.arguments as Item;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(itemArgs.name),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(itemArgs.imageUrl), // Menampilkan gambar produk
//             Text('Price: ${itemArgs.price.toStringAsFixed(2)}'),
//             Text('Stock: ${itemArgs.stock}'),
//             Text('Rating: ${itemArgs.rating} ⭐'),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../models/item.dart';
import 'package:belanja/widgets/footer.dart';

class ItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as Item;
    return Scaffold(
      appBar: AppBar(
          title: Text(
        item.name.toString(),
      )),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Hero(
                tag: 'imageHero${item.name}',
                child: SizedBox(
                  height: 250,
                  child: Image.network(
                    item.foto.toString(),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Text(
                          item.name.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        'Rp${(item.price)}',
                        style: TextStyle(
                          color: const Color.fromARGB(255, 49, 49, 49),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'Stok Tersisa: ',
                            ),
                            TextSpan(
                              text: '${item.stok}',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.star,
                  color: Colors.red[500],
                ),
                Text(item.rating.toString()),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

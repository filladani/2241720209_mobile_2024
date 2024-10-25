// import 'package:flutter/material.dart';
// import '../models/item.dart'; // Sesuaikan dengan path model item kamu

// class HomePage extends StatelessWidget {
//   // Daftar item yang ditampilkan
//   final List<Item> items = [
//     Item(
//       name: 'Sugar',
//       price: 5000,
//       imageUrl: 'assets/images/gula.jpg', // Path lokal untuk gambar
//       stock: 100,
//       rating: 4.5,
//     ),
//     Item(
//       name: 'Salt',
//       price: 2000,
//       imageUrl: 'assets/images/garam.jpg', // Path lokal untuk gambar
//       stock: 50,
//       rating: 4.0,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: GridView.builder(
//         itemCount: items.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           childAspectRatio: 0.7,
//         ),
//         itemBuilder: (context, index) {
//           final item = items[index];
//           return Card(
//             child: Column(
//               children: [
//                 Image.asset(
//                   item.imageUrl,
//                   fit: BoxFit.cover,
//                   height: 100, // Sesuaikan tinggi gambar
//                   width: double.infinity, // Lebar penuh
//                 ),
//                 Text(item.name),
//                 Text('Price: ${item.price}'), // Pastikan tidak ada simbol $
//                 Text('Stock: ${item.stock}'),
//                 Text('Rating: ${item.rating}'),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:belanja/models/item.dart';
import 'package:flutter/material.dart';
import 'package:belanja/widgets/footer.dart';

class HomePage extends StatelessWidget {
  final List<Item> items = [
    Item(
        name: 'Gula',
        price: 20000,
        stok: 50,
        rating: 5,
        foto: 'assets/images/gula.jpg'),
    Item(
        name: 'Garam',
        price: 20000,
        stok: 40,
        rating: 4,
        foto: 'assets/images/garam.jpg')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Item"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
              childAspectRatio: 0.7, // Number of columns in the grid
            ),
            padding: EdgeInsets.all(8),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/item', arguments: item);
                  },
                  child: Card(
                      child: Row(children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Hero(
                              tag: 'imageHero${item.name}',
                              child: SizedBox(
                                height: 150,
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
                                        color: const Color.fromARGB(
                                            255, 49, 49, 49),
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
                  ])));
            }),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}

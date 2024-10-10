import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Color color =
        Theme.of(context).primaryColor; // Mendefinisikan color dari tema

    return MaterialApp(
      title: 'Filla Ramadhani Utomo // 2241720209',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter layout demo'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'assets/images/gilitrawangan.jpg',
              width: 600,
              height: 200,
              fit: BoxFit.cover,
            ),
            titleSection, // Menampilkan titleSection
            buttonSection(
                color), // Menampilkan buttonSection dengan warna dari tema
            textSection, // Menampilkan textSection
          ],
        ),
      ),
    );
  }

  /* Tambahan metode _buildButtonColumn */
  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }

  /* Pindahkan buttonSection ke dalam class */
  Widget buttonSection(Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'CALL'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );
  }
}

/* titleSection dari kode sebelumnya */
Widget titleSection = Container(
  padding: const EdgeInsets.all(
      32), // beri padding 32 piksel di seluruh tepi Container
  child: Row(
    children: [
      Expanded(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // posisi kolom di awal baris
          children: [
            Container(
              padding: const EdgeInsets.only(
                  bottom: 8), // padding bawah sebesar 8 piksel
              child: const Text(
                'Wisata Gili Trawangan di Lombok',
                style: TextStyle(
                  fontWeight: FontWeight.bold, // teks tebal
                ),
              ),
            ),
            const Text(
              'Lombok, NTB, Indonesia',
              style: TextStyle(
                color: Colors.grey, // set warna abu-abu
              ),
            ),
          ],
        ),
      ),
      const Icon(
        Icons.star, // ikon bintang
        color: Colors.red, // set warna merah
      ),
      const Text('41'), // teks "41"
    ],
  ),
);

/* Menambahkan textSection */
Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: const Text(
    'Gili Trawangan merupakan pulau terbesar dari Kepulauan Gili yang ada di wilayah Lombok yang mempunyai jutaan pesona. '
    'Gili Trawangan terkenal akan kekayaan alam sekaligus kearifan lokalnya yang indah dan menarik. '
    'Ini membuat wisatawan lokal maupun mancengara menjadikan Gili Trawangan tujuan wisata selain Bali. '
    'Gili Trawangan memiliki deretan pantai dengan pesonanya yang begitu memikat. '
    'Hampir sebagian besar pantainya berpasir putih, kebersihannya pun begitu terjaga hingga wisatawan betah untuk beraktivitas atau sekadar bersantai. '
    '\n \n'
    'Filla Ramadhani Utomo '
    '\n \n'
    '2241720209',
    softWrap: true,
  ),
);

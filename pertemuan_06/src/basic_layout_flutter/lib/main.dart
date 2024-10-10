import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PavlovaPage(),
    );
  }
}

class PavlovaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Strawberry Pavlova"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Bagian kiri: Deskripsi dan Ratings
            Expanded(
              flex: 2, // Memberikan porsi lebih besar ke teks
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Strawberry Pavlova",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Pavlova is a meringue-based dessert named after the Russian ballerina Anna Pavlova. Pavlova features a crisp crust and soft, light inside, topped with fruit and whipped cream.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  // Baris 1: Rating dan Review (Ratings Row)
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.black),
                      Icon(Icons.star, color: Colors.black),
                      Icon(Icons.star, color: Colors.black),
                      Icon(Icons.star, color: Colors.black),
                      Icon(Icons.star_border, color: Colors.black),
                      SizedBox(width: 8),
                      Text("170 Reviews"),
                    ],
                  ),
                  SizedBox(height: 16),
                  // Baris 2: Ikon dan Teks (Icons Row)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // Kolom 1
                      Column(
                        children: [
                          Icon(Icons.timer),
                          SizedBox(height: 4),
                          Text("PREP:"),
                          SizedBox(height: 4),
                          Text("25 min"),
                        ],
                      ),
                      // Kolom 2
                      Column(
                        children: [
                          Icon(Icons.timer_outlined),
                          SizedBox(height: 4),
                          Text("COOK:"),
                          SizedBox(height: 4),
                          Text("1 hr"),
                        ],
                      ),
                      // Kolom 3
                      Column(
                        children: [
                          Icon(Icons.restaurant),
                          SizedBox(height: 4),
                          Text("FEEDS:"),
                          SizedBox(height: 4),
                          Text("4-6"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            // Bagian kanan: Gambar dari folder assets
            Expanded(
              flex: 3, // Memberikan lebih banyak ruang ke gambar
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  'assets/images/pavlova.jpg',
                  fit: BoxFit
                      .cover, // Membuat gambar mengisi ruang yang tersedia
                  height: double
                      .infinity, // Memastikan tinggi gambar mengikuti ruang yang tersedia
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'pages/home_page.dart'; // pastikan path ini benar
// import 'pages/item_page.dart'; // pastikan path ini benar

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key); // Constructor dengan 'const'

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => HomePage(),
//         '/item': (context) => ItemPage(),
//       },
//     );
//   }
// }

import 'package:belanja/pages/home_page.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => HomePage(),
      '/item': (context) => ItemPage(),
    },
  ));
}

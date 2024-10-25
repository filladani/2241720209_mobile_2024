import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      color: Color.fromARGB(255, 161, 161, 161),
      child: const Center(
        child: Text(
          'Filla Ramadhani Utomo (2241720209)',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

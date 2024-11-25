import 'package:flutter/material.dart';

class NavigationSecond extends StatefulWidget {
  const NavigationSecond({super.key});

  @override
  State<NavigationSecond> createState() => _NavigationSecondState();
}

class _NavigationSecondState extends State<NavigationSecond> {
  Color color = Colors.white;  // Initial color set to white.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navigation Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              child: const Text('Yellow'),
              onPressed: () {
                // Set the color to red and pop the current screen with the new color
                setState(() {
                  color = const Color.fromARGB(255, 189, 211, 47);
                });
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Orange'),
              onPressed: () {
                // Set the color to green and pop the current screen with the new color
                setState(() {
                  color = const Color.fromARGB(255, 235, 171, 11);
                });
                Navigator.pop(context, color);
              },
            ),
            ElevatedButton(
              child: const Text('Blue'),
              onPressed: () {
                // Set the color to blue and pop the current screen with the new color
                setState(() {
                  color = Colors.blue.shade700;
                });
                Navigator.pop(context, color);
              },
            ),
          ],
        ),
      ),
    );
  }
}

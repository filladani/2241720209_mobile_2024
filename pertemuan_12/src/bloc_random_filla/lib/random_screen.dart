import 'package:flutter/material.dart';
import 'random_bloc.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  final RandomNumberBloc _bloc = RandomNumberBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Number'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber,  // Menyambung dengan stream dari BLoC
          initialData: 0,  // Data awal yang ditampilkan
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                'Random Number: ${snapshot.data}',  // Menampilkan angka acak
                style: const TextStyle(fontSize: 24),
              );
            } else if (snapshot.hasError) {
              return const Text('Error generating random number');
            } else {
              return const CircularProgressIndicator();  // Menunggu data pertama
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.generateRandom.add(null),  // Menambah event ke stream
        child: const Icon(Icons.refresh),  // Ikon untuk memicu refresh
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();  // Menutup BLoC saat widget dibuang
    super.dispose();
  }
}

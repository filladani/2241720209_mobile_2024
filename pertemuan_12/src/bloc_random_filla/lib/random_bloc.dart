import 'dart:async';
import 'dart:math';

class RandomNumberBloc {
  // StreamController untuk input event
  final StreamController<void> _generateRandomController = StreamController<void>();
  
  // StreamController untuk output angka acak
  final StreamController<int> _randomNumberController = StreamController<int>();

  // Input Sink: Untuk menambah event ke dalam stream
  Sink<void> get generateRandom => _generateRandomController.sink;

  // Output Stream: Untuk mengirim angka acak
  Stream<int> get randomNumber => _randomNumberController.stream;

  RandomNumberBloc() {
    // Mendengarkan stream input dan menghasilkan angka acak
    _generateRandomController.stream.listen((_) {
      final random = Random().nextInt(10);  // Menghasilkan angka acak antara 0 dan 9
      _randomNumberController.sink.add(random);  // Menambah angka acak ke stream
    });
  }

  void dispose() {
    _generateRandomController.close();  // Menutup StreamController
    _randomNumberController.close();    // Menutup StreamController
  }
}

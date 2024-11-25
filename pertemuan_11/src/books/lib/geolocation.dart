import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  Future<Position>? position;

  @override
  void initState() {
    super.initState();
    // Inisialisasi Future
    position = getPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Current Location by Filla'),
      ),
      body: Center(
        // Menggunakan FutureBuilder untuk memproses Future
        child: FutureBuilder<Position>(
          future: position,
          builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // Menampilkan animasi loading
              return const CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                // Tampilkan data jika Future berhasil
                final data = snapshot.data!;
                return Text(
                  'Latitude: ${data.latitude}\nLongitude: ${data.longitude}',
                  textAlign: TextAlign.center,
                );
              } else if (snapshot.hasError) {
                // Tampilkan pesan error jika Future gagal
                return Text('Error: ${snapshot.error}');
              }
            }
            // Default return jika kondisi lain
            return const Text('No data available');
          },
        ),
      ),
    );
  }

  Future<Position> getPosition() async {
    // Memastikan layanan lokasi aktif
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception('Location services are disabled');
    }

    // Meminta izin lokasi
    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw Exception('Location permissions are denied');
    }

    // Menambahkan delay untuk simulasi loading
    await Future.delayed(const Duration(seconds: 3));

    // Mengambil posisi perangkat
    return await Geolocator.getCurrentPosition();
  }
}

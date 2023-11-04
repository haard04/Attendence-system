import 'package:attendence/home.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  final locationService = LocationService();
  await locationService.initLocationService();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class LocationService {
  Future<void> initLocationService() async {
    final Geolocator geolocator = Geolocator();
    final LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // Handle denied permission
      // You can show a dialog or message to request permission again
    } else if (permission == LocationPermission.deniedForever) {
      // Handle denied permission forever
      // You can show a dialog or message directing users to app settings
    } else {
      // Permission granted, you can proceed with location services
    }
  }
}
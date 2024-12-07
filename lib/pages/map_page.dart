import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController mapController;

  final CameraPosition _initialPosition = const CameraPosition(
    target: LatLng(40.730610, -73.935242), // Example: New York
    zoom: 12,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Location'),
      ),
      body: GoogleMap(
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          mapController = controller;
        },
        markers: {
          Marker(
            markerId: const MarkerId('restaurant'),
            position: const LatLng(40.730610, -73.935242),
            infoWindow: const InfoWindow(title: 'Restaurant Location'),
          ),
        },
      ),
    );
  }
}

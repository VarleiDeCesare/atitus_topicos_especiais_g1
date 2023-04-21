import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'api.dart';
import 'package:dio/dio.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final _markers = Set<Marker>();
  late GoogleMapController _mapController;
  late Api _api;

  @override
  void initState() {
    super.initState();
    _api = Api(Dio());
    _addMarkers();
  }

  Future<void> _addMarkers() async {
    final locations = await _api.getUsers();
    setState(() {
      _markers.addAll(locations.data.map((location) => Marker(
            markerId: MarkerId('${location.latitude},${location.longitude}'),
            position: LatLng(location.latitude, location.longitude),
            infoWindow: InfoWindow(title: location.name, snippet: location.cargo),
          )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 80,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/text');
                  },
                  child: const Text('Dados dos desenvolvedores'),
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) {
                _mapController = controller;
              },
              initialCameraPosition: const CameraPosition(
                target: LatLng(-28.17, -51.8),
                zoom: 11,
              ),
              markers: _markers,
            ),
          ),
        ],
      ),
    );
  }
}

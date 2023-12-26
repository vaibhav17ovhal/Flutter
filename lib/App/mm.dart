import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';


class mapp extends StatefulWidget {
  const mapp({super.key});

  @override
  State<mapp> createState() => _mappState();
}

class _mappState extends State<mapp> {

  static final CameraPosition pos = const CameraPosition(target: LatLng(22.719568, 75.857727),
      zoom: 10);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: pos,
        mapType: MapType.hybrid,
        myLocationEnabled: true
      ),
    );
  }
}

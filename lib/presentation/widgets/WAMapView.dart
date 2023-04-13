import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class WAMapView extends StatelessWidget {
  const WAMapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MapboxMap(
      accessToken:
          'sk.eyJ1IjoiZmF0aW1hYXBwIiwiYSI6ImNsZmY1Ym8wbzQxNWkzdnIwYng0bGd1YnQifQ.UZ05F6nedMFKR9Eg1ps-aw',
      initialCameraPosition: const CameraPosition(
        target: LatLng(37.7749, -122.4194),
        zoom: 10.0,
      ),
    );
  }
}

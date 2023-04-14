import 'package:fatima_admin/config/CustomColors.dart';
import 'package:fatima_admin/presentation/widgets/WAIconButton.dart';
import 'package:fatima_admin/presentation/widgets/WASearchBarView.dart';
import 'package:fatima_admin/presentation/widgets/WATopView.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

class WAMapView extends StatelessWidget {
  const WAMapView({Key? key}) : super(key: key);

  onPress(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const WATopView(title: 'Select your location'),
        Expanded(
          child: Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              MapboxMap(
                accessToken:
                    'sk.eyJ1IjoiZmF0aW1hYXBwIiwiYSI6ImNsZmY1Ym8wbzQxNWkzdnIwYng0bGd1YnQifQ.UZ05F6nedMFKR9Eg1ps-aw',
                initialCameraPosition: const CameraPosition(
                  target: LatLng(37.7749, -122.4194),
                  zoom: 10.0,
                ),
              ),
              WASearchBarView(),
            ],
          ),
        ),
      ],
    );
  }
}

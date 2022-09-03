import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './location.dart' as location;

class Maps extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();
  final CameraPosition _initialPos =
      const CameraPosition(target: LatLng(43.607905, 3.886314), zoom: 18);

  void handleTap() {
    location.getLocation().then((value) => print(value));
  }

  void handleButtonPress() async {
    await location.getLocation().then((userPosition) => {
          _controller.future
              .then((value) => {
                    if (userPosition.latitude != null &&
                        userPosition.longitude != null)
                      {
                        value.animateCamera(CameraUpdate.newLatLngZoom(
                            LatLng(userPosition.latitude!,
                                userPosition.longitude!),
                            18))
                      }
                  })
              .catchError((error) => print(error))
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        buildingsEnabled: true,
        compassEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        onTap: (argument) => handleTap(),
        onLongPress: (argument) => print(argument),
        initialCameraPosition: _initialPos,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        zoomControlsEnabled: false,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => handleButtonPress(),
        child: const Icon(Icons.my_location_sharp),
      ),
    );
  }
}

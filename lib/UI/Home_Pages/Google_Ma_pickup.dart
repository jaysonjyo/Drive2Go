
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../main.dart';



class GoogleMapickup extends StatefulWidget {
  const GoogleMapickup({super.key});

  @override
  State<GoogleMapickup> createState() => _GoogleMapickupState();
}

class _GoogleMapickupState extends State<GoogleMapickup> {
  LatLng myCurrentLocation = const LatLng(27.7172, 85.3240);
   GoogleMapController? googleMapController;
  Set<Marker> markers = {};
  LatLng? tappedLocation;

//conver to place
    Future<void> _getAddressFromLatLng(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      Placemark place = placemarks[0];

      setState(() {
pickuplocationcontroller.text=place.locality??"";
      });

      print("Address: ${pickuplocationcontroller.text}");
    } catch (e) {
      print(e);
    }
  }
 // convert code end

@override
  Widget build(BuildContext context) {
  return Scaffold(
    body:
    GoogleMap(
      myLocationButtonEnabled: false,
      markers: markers,
      onMapCreated: (GoogleMapController controller) {
        googleMapController = controller;
      },
      initialCameraPosition: CameraPosition(
        target: myCurrentLocation,
        zoom: 14,
      ),
      onTap: (LatLng position) async{
        // Handle map tap
        setState(() {
          tappedLocation = position;
          markers.clear();
          markers.add(
            Marker(
              markerId: const MarkerId('selectedLocation'),
              position: position,
            ),
          );
          _getAddressFromLatLng(position).then((onValue){
            Navigator.of(context).pop();
          });
        });


      },
    ),
    // Floating action button to get user's current location
    floatingActionButton: FloatingActionButton(
      backgroundColor: Colors.white,
      child: const Icon(
        Icons.my_location,
        size: 30,
      ),
      onPressed: () async {
        print("hello");
        // Getting the current position of the user
        Position position = await currentPosition();

        // Animating the camera to the user's current position
        googleMapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 14,
            ),
          ),
        );

        // Clearing existing markers
        markers.clear();
        // Adding a new marker at the user's current position
        markers.add(
          Marker(
            markerId: const MarkerId('currentLocation'),
            position: LatLng(position.latitude, position.longitude),
          ),
        );
        print("Current location: ${position.latitude}, ${position.longitude}");

        // Refreshing the state to update the UI with new markers
        setState(() {});
      },
    ),
    bottomNavigationBar: tappedLocation == null
        ? null
        : Container(
      padding: EdgeInsets.all(16.sp),
      color: Colors.white,
      child: Text(
        'Selected Location: ${tappedLocation!.latitude}, ${tappedLocation!.longitude}',
        style: TextStyle(fontSize: 16.sp),
      ),
    ),
  );

}
//current location
  Future<Position> currentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Checking if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {

      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    // Checking the location permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // Requesting permission if it is denied
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    // Handling the case where permission is permanently denied
    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');

    }

    // Getting the current position of the user
    Position position = await Geolocator.getCurrentPosition();

    return position;

  }
//current location end
}



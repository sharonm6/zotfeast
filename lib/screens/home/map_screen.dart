import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:zotfeast/config/color_constants.dart';
//import 'package:location/location.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:math' show asin, cos, pi, sin, sqrt;

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position? currentPosition;
  double _toRadians(double degrees) {
    return degrees * (pi / 180);
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      if (!mounted) {
        return;
      }
      setState(() {
        currentPosition = position;
      });
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

  Widget build(BuildContext context) {
    double current_latitude = currentPosition?.latitude ?? 0;
    double current_longitude = currentPosition?.longitude ?? 0;
    const double earthRadius = 3958.8; // Radius of the earth in miles
    List<double> albertons = [33.65027288359544, -117.83136622883586];
    List<double> target = [33.649766664660625, -117.83894866177054];
    double a_lat = albertons[0];
    double a_long = albertons[1];
    double t_lat = target[0];
    double t_long = target[1];

    // current location to Albertsons
    double dLat = _toRadians(a_lat - current_latitude);
    double dLon = _toRadians(a_long - current_longitude);
    double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(current_latitude)) *
            cos(_toRadians(a_lat)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * asin(sqrt(a));
    double alberton_miles = earthRadius * c;

    // current location to Target
    double target_Lat = _toRadians(t_lat - current_latitude);
    double target_Lon = _toRadians(t_long - current_longitude);
    double y = sin(target_Lat / 2) * sin(target_Lat / 2) +
        cos(_toRadians(current_latitude)) *
            cos(_toRadians(a_lat)) *
            sin(target_Lon / 2) *
            sin(target_Lon / 2);
    double z = 2 * asin(sqrt(y));
    double target_miles = earthRadius * z;

    // Convert latitude and longitude from degrees to radians
    //distance = math.sqrt(((x2-x1)**2 + (y2-y1)**2))
    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Where Are You At?",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Latitude: ${currentPosition?.latitude ?? ''}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 20),
          Text(
            'Longitude: ${currentPosition?.longitude ?? ''}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 20),
          Text(
            'Distance from Target: ${target_miles * 1.5} miles',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 20),
          Text(
            'Distance from Albertons: ${alberton_miles * 1.5} miles',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}

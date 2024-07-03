import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:rent_cruise/service/location_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationProvider with ChangeNotifier {
  Position? currentPosition;

  final LocationService _locationService = LocationService();

  Placemark? currentLocation;

  Future<void> determinePosition() async {
    print(currentLocation);
    try {
      notifyListeners();
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        currentPosition = null;
        notifyListeners();
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();

        if (permission == LocationPermission.denied) {
          currentPosition = null;
          notifyListeners();
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        currentPosition = null;
        notifyListeners();
        return;
      }

      currentPosition = await Geolocator.getCurrentPosition();
      print("Current position: $currentPosition");
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setDouble('latitude', currentPosition!.latitude);
      await prefs.setDouble('longitude', currentPosition!.longitude);

      await prefs.setBool('isLogin', true);

      currentLocation = await _locationService.getLocationName(currentPosition);
      print("Current name: $currentLocation");
    } catch (e) {
      print("Error determining position: $e");
      // Handle the error gracefully, e.g., notify the user.
    } finally {
      notifyListeners();
    }
  }
}

import 'package:geolocator/geolocator.dart';

/// A service for handling geolocation-related functionality.
class GeolocationService {
  /// Indicates whether location services are currently disabled.
  bool isLocationServicesDisabled = false;

  /// Indicates whether location permission is denied.
  bool isLocationPermissionDenied = false;

  /// Indicates whether location permission is denied forever.
  bool isLocationPermissionDeniedForever = false;

  /// Indicates whether location services are allowed.
  bool isLocationServiceAllowed = false;

  /// The current longitude of the device's position.
  double longitude = 0;

  /// The current latitude of the device's position.
  double latitude = 0;

  /// Indicates whether the device's position has been set.
  bool positionSet = false;

  /// Determine the current position of the device.
  ///
  Future<void> checkPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      isLocationServicesDisabled = true;
      isLocationServiceAllowed = false;
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        isLocationPermissionDenied = true;
        isLocationServiceAllowed = false;
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever; handle appropriately.
      isLocationServiceAllowed = false;
      isLocationPermissionDeniedForever = true;
      return;
    }
    // When we reach here, permissions are granted, and we can
    // continue accessing the position of the device.
    isLocationServiceAllowed = true;
    final position = await Geolocator.getCurrentPosition();
    longitude = position.longitude;
    latitude = position.latitude;
    positionSet = true;
  }

  /// Calculate the distance in kilometers between the current location
  /// and a target location specified by [targetLatitude] and [targetLongitude].
  ///
  /// - [targetLatitude]: The latitude of the target location.
  /// - [targetLongitude]: The longitude of the target location.
  ///
  /// Returns the distance in kilometers.
  double getDistanceKilometresFromCurrentLocation(
    double targetLatitude,
    double targetLongitude,
  ) {
    final distance = Geolocator.distanceBetween(
      latitude,
      longitude,
      targetLatitude,
      targetLongitude,
    );
    final km = distance / 1000.0;
    return km;
  }
}

import 'package:geolocator/geolocator.dart';

Future<Position> getLocation() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Check if the device's location is active
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // If location isn't activated, asks the user to enable it
    return Future.error('Location isn\'t enabled');
  }

  // Check if we have permission to access device location
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // If we don't, asks the user to concede
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // If the user doesn;t allow it, shows an error
      return Future.error('Location permission was denied');
    }
  }

  // If we have permission, we access to the location
  return await Geolocator.getCurrentPosition();
}

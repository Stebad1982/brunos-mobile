import 'package:geocoding/geocoding.dart';

Future<Placemark> convertCoordinatesToPlaces({required double latitude, required double longitude}) async {
  List<Placemark> placeMarks = await placemarkFromCoordinates(
      latitude, longitude);
  return placeMarks.first;
}
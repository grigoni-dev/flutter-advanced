import 'package:google_maps_flutter/google_maps_flutter.dart';

class CityModel {
  String text;
  LatLng coordinates;

  CityModel({
    required this.text,
    required this.coordinates,
  });

  static final cities = [
    CityModel(
      text: "Milano",
      coordinates: LatLng(45.46945437537588, 9.192836724646723),
    ),
    CityModel(
      text: "Roma",
      coordinates: LatLng(41.9145848062944, 12.45496648573471),
    ),
    CityModel(
      text: "Venezia",
      coordinates: LatLng(45.44493887768228, 12.341320725730176),
    ),
    CityModel(
      text: "Treviso",
      coordinates: LatLng(45.66641513901032, 12.24546213753062),
    ),
    CityModel(
      text: "Bologna",
      coordinates: LatLng(44.495582843921476, 11.343545510431548),
    ),
    CityModel(
      text: "Palermo",
      coordinates: LatLng(38.154423935348284, 13.375120031701035),
    )
  ];
}

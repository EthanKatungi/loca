import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';

class Location {
  double? longitudeData;
  double? latitudeData;

  Location({this.latitudeData, this.longitudeData});

  Future getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      longitudeData = position.longitude;
      latitudeData = position.latitude;
    } catch (e) {
      print(e);
    }
  }
}

// ignore_for_file: prefer_const_constructors
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:loca/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitudeData);
    print(location.longitudeData);
  }

  void getData() async {
    Response response = await get(Uri.parse(
        'https://api.openweathermap.org/data/3.0/onecall?lat=65.9667&&lon=-18.5333&appid=01435de1510cbc1917579103e5030500'));
    print(response.body);
  }


  //LIFE CYCLE METHODS
  //use innit state method at the start of the app
  //use the build method whenever the app is rebuilt(at change of state)
  //use deactivate when something is being destroyed
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}

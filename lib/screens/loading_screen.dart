import 'package:flutter/material.dart';
import 'package:tempo_template/services/location.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getData() async {
    var url = Uri.parse('https://samples.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=b6907d289e10d714a6e88b30761fae22');
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      var data = response.body;
      print(data);
    } else {
      print(response.statusCode);
    }
  }

  Future<void> getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print("Latitude: ${location.latitude}");
    print("Longitude: ${location.longitude}");
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
    );
  }
}
import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/weather.dart';
import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var local = Location();

  late double latitude;
  late double longitude;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void pushToLocationScreen(dynamic weatherData) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(localWeatherData: weatherData);
    }));
  }

  void getData() async {
    var weatherData = await WeatherModel().getLocationWeather();
    pushToLocationScreen(weatherData);
  }

  Future<void> getLocation() async {
    await local.getCurrentPosition();

    latitude = local.latitude;
    longitude = local.longitude;

    getData();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitDoubleBounce(
        color: Colors.white,
        size: 100.0,
      ),
    );
  }
}
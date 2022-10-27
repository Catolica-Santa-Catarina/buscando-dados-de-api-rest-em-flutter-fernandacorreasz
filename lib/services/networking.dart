import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../screens/loading_screen.dart';

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  void getData() async {
    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/'
        'data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
  }
}
import '../data/weather_model.dart';
import 'package:http/http.dart' as http;

class WeatherRepository{

  var api_client = http.Client();
  String apiKey = "64df35334990c66cffaf1b4aa0d24191";
  int cnt = 24;

  /// отправка запроса и получение ответа с API
  Future<Weather?> fetchWeatherData(String city) async{
    String baseUrl = "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric&lang=ru&cnt=$cnt";

    final response = await api_client.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var jsonString = response.body;
      return weatherFromJson(jsonString);
    } else {
      return null;
    }
  }
}
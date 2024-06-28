import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  Dio dio = Dio();
  Future<WeatherModel> getWeather({required String cityName}) async {
    String baseURL = 'https://api.weatherapi.com/v1';
    String apiKey = 'ee190aa310bc40baaf3223533241506';

    try {
      Response response = await dio
          .get('$baseURL/forecast.json?key=$apiKey&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } catch (e) {
      throw (e.toString());
    }
  }
}

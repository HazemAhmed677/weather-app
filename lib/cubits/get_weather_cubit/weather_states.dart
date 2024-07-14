import 'package:weather_app/models/weather_model.dart';

class WeatherState {}

class WeatherIntialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WaatherSuccessState extends WeatherState {
  WeatherModel weatherModel;
  WaatherSuccessState({required this.weatherModel});
}

class WeatherFalierState extends WeatherState {}

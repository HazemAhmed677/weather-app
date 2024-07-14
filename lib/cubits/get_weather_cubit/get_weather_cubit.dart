import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/wheather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherIntialState());
  WeatherModel? weatherModel;
  late String errorMsg;
  getWeather({required String cityName}) async {
    try {
      emit(WeatherLoadingState());
      weatherModel = await WeatherService().getWeather(cityName: cityName);
      emit(WaatherSuccessState());
    } catch (e) {
      if (e.toString().contains('400') || e.toString().contains('Invalid')) {
        errorMsg = 'No conutry with this name';
      } else {
        errorMsg = 'Oops, sever isn\'t available for now, try later';
      }
      emit(WeatherFalierState());
    }
  }
}
// 1- create states
// 2- create cubit          (first phase)
// 3- create function
// Done
// --------------------------------------
// 4- provide cubit
// 5- integerte cubit
// 6- trigger cubit
// Done
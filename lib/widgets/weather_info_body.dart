import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import '../cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});
  @override
  Widget build(BuildContext context) {
    ;
    return BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
      if (state is WeatherLoadedState) {
        WeatherModel weatherModel =
            BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                kGetWeatherColor(weatherModel.status).shade500,
                kGetWeatherColor(weatherModel.status).shade200,
                kGetWeatherColor(weatherModel.status).shade50,
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  weatherModel.cityName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Text(
                  'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                  style: const TextStyle(
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'https:${weatherModel.image!}',
                    ),
                    Text(
                      '${weatherModel.avgTemp.round()}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          'Maxtemp: ${weatherModel.maxTemp.round()}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          'Mintemp: ${weatherModel.minTemp.round()}',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 32,
                ),
                Text(
                  weatherModel.status!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
          ),
        );
      } else if (state is WeatherFalierState) {
        return const Center(
          child: Text(
            'Sorry weather for this country  not available for now ',
          ),
        );
      } else {
        return const SizedBox();
      }
    });
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/weather_states.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/views/search_screen.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetWeatherCubit, WeatherState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 70,
            shadowColor: Colors.black,
            elevation: 10,
            title: const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text('Weather App'),
            ),
            backgroundColor: kGetWeatherColor(
                BlocProvider.of<GetWeatherCubit>(context).weatherModel?.status),
            actions: [
              IconButton(
                iconSize: 30,
                splashColor: Colors.black,
                hoverColor: Colors.black,
                onPressed: () => {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const SearchView();
                      },
                    ),
                  ),
                },
                icon: const Icon(
                  Icons.search,
                ),
              ),
            ],
          ),
          body: BlocBuilder<GetWeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherIntialState) {
                return const NoWeatherBody();
              } else if (state is WeatherLoadedState) {
                return const WeatherInfoBody();
              } else {
                return const Text('Oops there something wrong, try later');
              }
            },
          ),
        );
      },
    );
  }
}

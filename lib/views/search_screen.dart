import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Search City"),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextField(
              onSubmitted: (value) {
                var obj = BlocProvider.of<GetWeatherCubit>(context);
                obj.getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                label: const Text('Search'),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  ),
                ),
                hintText: 'Enter a city',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 25,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide:
                      const BorderSide(color: Color.fromARGB(255, 101, 87, 74)),
                ),
              ),
            ),
          ),
        ));
  }
}

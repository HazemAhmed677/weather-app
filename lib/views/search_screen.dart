import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? input;
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search City"),
          backgroundColor: Colors.grey,
          elevation: 10,
          shadowColor: Colors.black,
          toolbarHeight: 70,
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              controller: textEditingController,
              validator: (value) {
                if (value == '') {
                  return 'Please enter a city';
                }
                return null;
              },
              onSaved: (value) {
                input = value;
              },
              onFieldSubmitted: (value) async {
                await triggerGetWeatherCubit(context);
              },
              decoration: InputDecoration(
                label: const Text('Search'),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: IconButton(
                    onPressed: () async {
                      await triggerGetWeatherCubit(context);
                    },
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
        ),
      ),
    );
  }

  Future<void> triggerGetWeatherCubit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      Navigator.pop(context);
      await BlocProvider.of<GetWeatherCubit>(context)
          .getWeather(cityName: input!);
      autoValidateMode = AutovalidateMode.disabled;
    } else {
      autoValidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}

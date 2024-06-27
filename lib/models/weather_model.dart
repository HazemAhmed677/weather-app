class WeatherModel {
  final String? image;
  final String cityName;
  final DateTime date;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String? status;
  WeatherModel(
      {this.image,
      required this.cityName,
      required this.date,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.status});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      // json is responde.data
      // so access each param by its path(keys)
      // consider map of map o of list and so on
      cityName: json['location']['name'],
      date: DateTime.parse(json['location']['localtime']),
      image: json['forecast']['forecastday'][0]['day']['condition']['icon'],
      status: json['forecast']['forecastday'][0]['day']['condition']['text'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
    );
  }
}

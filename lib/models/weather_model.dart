import 'package:flutter/material.dart';

class WeatherModel
{
  String date ;
  double temp ;
  double maxTemp ;
  double minTemp ;
  String weatherStateName ;

  WeatherModel({required this.date, required this.temp,required this.maxTemp,required this.minTemp,required this.weatherStateName});

  factory WeatherModel.fromJson(dynamic data)
  {
    var jsonData = data["forecast"]["forecastday"][0];
    return WeatherModel(date:data["location"]["localtime"], temp: jsonData["day"]["avgtemp_c"], maxTemp:jsonData["day"]["maxtemp_c"], minTemp: jsonData["day"]["mintemp_c"], weatherStateName:jsonData["day"]["condition"]["text"]);
    
  }

  @override
  String toString() {
    return 'temp = $temp  minTemp = $minTemp  maxTemp = $maxTemp';
  }

  String getImage() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud' || weatherStateName == 'Sunny' ||  weatherStateName == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (
        
        weatherStateName == 'Sleet' ||  weatherStateName == 'Snow'  ||  weatherStateName == 'Hail' 
        || weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherStateName == 'Heavy Cloud' || 
    weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' || weatherStateName == 'Mist'
    ) {
      return 'assets/images/cloudy.png';
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' || 
        weatherStateName == 'Patchy rain possible'
        ) {
      return 'assets/images/rainy.png';
    } else if (weatherStateName == 'Thunderstorm'  || weatherStateName == 'Thunder' ||
    weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' 
    ) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  } 

  MaterialColor getThemeColor() {
    if (weatherStateName == 'Clear' || weatherStateName == 'Light Cloud' || weatherStateName == 'Sunny' ||  weatherStateName == 'partly cloudy') {
      return Colors.orange;
    } else if(
        
        weatherStateName == 'Sleet' ||  weatherStateName == 'Snow'  ||  weatherStateName == 'Hail' 
        || weatherStateName == 'Blizzard' ||  weatherStateName == 'Patchy snow possible'  ||  weatherStateName == 'Patchy sleet possible' || weatherStateName == 'Patchy freezing drizzle possible' || weatherStateName == 'Blowing snow') {
      return Colors.blue;     }
      else if (weatherStateName == 'Heavy Cloud' || 
    weatherStateName == 'Freezing fog' || weatherStateName == 'Fog' || weatherStateName == 'Mist'
    ) {
      return Colors.blueGrey;
    } else if (weatherStateName == 'Light Rain' ||
        weatherStateName == 'Heavy Rain' ||
        weatherStateName == 'Showers' || 
        weatherStateName == 'Patchy rain possible'
        ) {
      return Colors.blue;
    } else if (weatherStateName == 'Thunderstorm'  || weatherStateName == 'Thunder' ||
    weatherStateName == 'Thundery outbreaks possible' || weatherStateName == 'Moderate or heavy snow with thunder' || weatherStateName == 'Patchy light snow with thunder'|| weatherStateName == 'Moderate or heavy rain with thunder' || weatherStateName == 'Patchy light rain with thunder' 
    ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  } 


}
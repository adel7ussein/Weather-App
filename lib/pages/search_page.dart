import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {

  String? cityName;
  VoidCallback? updateUi;

  SearchPage ({this.updateUi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
    
    body: Column(
      children: [
        const Spacer(flex: 1,),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              child: TextField(
                onSubmitted: (data) async
                {
                  cityName = data;
                  WeatherService service = WeatherService();
                  WeatherModel? weather = await service.getWeather(cityName: cityName!);
                  Provider.of<WeatherProvider>(context, listen: false).weatherData = weather;
                  Provider.of<WeatherProvider>(context, listen: false).cityName = cityName ;
                  Navigator.pop(context);
                 
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(vertical: 32, horizontal: 24),
                  label: Text('search'),
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                  hintText: 'Enter a city'
                ),
              ),
            ),
          ),
        ),
        const Spacer(flex: 7,),
      ],
    ),
    );
  }
}
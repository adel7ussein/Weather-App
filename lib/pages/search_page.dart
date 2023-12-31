import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';

class SearchPage extends StatelessWidget {

  String? cityName;
  VoidCallback? updateUi;

  SearchPage ({this.updateUi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
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
                  BlocProvider.of<WeatherCubit>(context).getWeather(cityName: cityName!);
                  BlocProvider.of<WeatherCubit>(context).cityName = cityName ;
                  Navigator.pop(context);

                },
                decoration: const InputDecoration(
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
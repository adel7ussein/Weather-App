import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/weather_cubit/weather_cubit.dart';
import 'package:weather_app/cubits/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

import '../custom_widget/custom_center_widget.dart';
import '../custom_widget/custom_success_body.dart';

class HomePage extends StatelessWidget {
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage();
                }));
              },
              icon: const Icon(Icons.search),
            )
          ],
          title: const Text('Weather App'),
        ),
        body:
            BlocBuilder<WeatherCubit, WeatherState>(builder: (context, state) {
          if (state is WeatherLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherSuccess) {
            return SuccessBody(weatherData: state.weatherModel);
          } else if (state is WeatherFailure) {
            return CustomCenter(
                text: 'Something went wrong please try again 😔');
          } else {
            return CustomCenter(
              text: 'searching now for the weather 🔍',
            );
          }
        }));
  }
}

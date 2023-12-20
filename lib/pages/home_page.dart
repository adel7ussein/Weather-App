import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

import '../providers/weather_provider.dart';

class HomePage extends StatefulWidget {
   HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void updateUi()
  {
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherData =  Provider.of<WeatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)
            {
              return SearchPage(updateUi : updateUi);
            }));
          }, icon: Icon(Icons.search),)
        ],
        title: Text('Weather App'),
      ),
      body: weatherData == null ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            
            Text(
              'searching now for the weather 🔍',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
              ),
            )
          ],
        ),
      ): Container(
        
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              weatherData.getThemeColor(),
              weatherData.getThemeColor()[300]!,
              weatherData.getThemeColor()[100]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter, 
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Spacer(flex: 3,),
          Text(Provider.of<WeatherProvider>(context, listen: false).cityName!,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
          Text('updated: 12-08-2020',style: TextStyle(fontSize: 22,)),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Image.asset(weatherData.getImage()),
            Text('${weatherData.temp.toInt()}',style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
            Column(
              children: [
                Text('maxTemp : ${weatherData.maxTemp.toInt()}'),
                Text('minTemp : ${weatherData.minTemp.toInt()}'),


              ],
            )

          ],),
          Spacer(),
          Text(weatherData.weatherStateName,style: TextStyle(fontSize: 32,fontWeight: FontWeight.bold),),
          const Spacer(flex: 5,),


        ]),
      ),
    );
  }
}

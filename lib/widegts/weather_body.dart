import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherModel=BlocProvider.of<GetWeatherCubit>(context).weatherModel;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
           Text(weatherModel.cityName,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
           SizedBox(height: 100,),
           Text("${weatherModel.temp}",style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold),),
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               Text(weatherModel.weatherCondition,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
               SizedBox(width: 8,),
               Text('${weatherModel.maxtemp.round()}/${weatherModel.mintemp.round()}'
               ,style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          const SizedBox(height: 40,),
          Image.network('https:${weatherModel.image}'),

          //  Text("Updated at: ${weatherModel.date.hour} : ${weatherModel.date.minute}",style: TextStyle(fontSize: 23,),),
            
        ],
      ),
    );
  }
}
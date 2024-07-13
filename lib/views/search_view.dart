import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("search a city"),
        ),

        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: TextField(
              onSubmitted: (value) {
                var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "search",
                labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),
                hintText: "Enter City Name",
                suffixIcon: IconButton(onPressed: (){}, icon: Icon(Icons.search)),
              ),
            ),
          ),
        ),
    );
  }
}
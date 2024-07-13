import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio ;

  WeatherService(this.dio);

  final String baseUrl='http://api.weatherapi.com/v1';
  final String apikey='8710ad22b0934ec6b8562634242506';
  
  Future<WeatherModel> getWeather({required String cityName})async{
    try {
      Response response=
      await dio.get('$baseUrl/forecast.json?key=$apikey&q=$cityName&days=3&aqi=no&alerts=no');
      WeatherModel weatherModel=WeatherModel.formJson(response.data);
      
      return weatherModel;
    }on DioException catch (e) {
      final String errMessage=e.response?.data['error']['message'] ?? 
      'oops there was an error, try later';

      throw Exception(errMessage);
      
    } catch(e){
      log(e.toString());
      throw Exception('oops there was an error, try later');
    }
  }
  
}
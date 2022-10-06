import 'package:weather_app/services/networking.dart';
import 'package:weather_app/services/location_file.dart';

const apiKey='312a0b2f2e445027c24cc1ef1fa515ec';
const openApiMap='https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

 Future<dynamic> getCityWeather(String cityName) async{
    var url='$openApiMap?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper=NetworkHelper(url);
    var weatherData= await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async{
    Location location=Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper= NetworkHelper('$openApiMap?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    var weatherData=await networkHelper.getData();
    return weatherData;

  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}

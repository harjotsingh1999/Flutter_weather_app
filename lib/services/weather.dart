import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';


const String apiKey = "53d2d06a96d56b5bfda51a0d620dbad3";
const String openWeatherBaseUrl="https://api.openweathermap.org/data/2.5/weather";


class WeatherModel {
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
    if(temp==1000)
      return "Data not available";
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

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);

    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherBaseUrl?lat=${location.latitude}&lon=${location.longitude}&units=metric&appid=$apiKey");

    var weatherData= await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getCityWeather(String cityName) async
  {
    print("getCityWeather called for city= $cityName");
    NetworkHelper networkHelper = NetworkHelper(
        "$openWeatherBaseUrl?q=$cityName&units=metric&appid=$apiKey");

    var weatherData= await networkHelper.getData();
    return weatherData;
  }
}

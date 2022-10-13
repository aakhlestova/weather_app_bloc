import 'package:equatable/equatable.dart';

class WeatherEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}
/// событие по получению данных о погоде с API
class FetchWeatherEvent extends WeatherEvent{
  final city;
  FetchWeatherEvent(this.city);

  @override
  // TODO: implement props
  List<Object> get props => [city];
}

/// событие по очистке полученных данных
class ClearWeatherEvent extends WeatherEvent{

}
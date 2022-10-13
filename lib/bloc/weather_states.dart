import 'package:equatable/equatable.dart';

import '../data/weather_model.dart';

class WeatherState extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => [];
}

/// состояние до отправки запроса на получение данных о погоде -- initial State
class WeatherIsNotSearchedState extends WeatherState{

}
/// состояние во время получения, загрузки данных
class WeatherIsLoadingState extends WeatherState{

}

/// состояние после получения данных
class WeatherIsLoadedState extends WeatherState{
  final weather;

  WeatherIsLoadedState(this.weather);

  Weather get fetchWeather => weather;

  @override
  // TODO: implement props
  List<Object> get props => [weather];
}

/// состояние при возникновении ошибки/исключения
class WeatherIsNotLoadedState extends WeatherState{

  final String error;

  WeatherIsNotLoadedState(this.error);

  String get getError => error;

  @override
  // TODO: implement props
  List<Object> get props => [error];

}
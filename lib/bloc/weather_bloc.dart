import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_events.dart';
import 'package:weather_app_bloc/bloc/weather_states.dart';
import 'package:weather_app_bloc/domain/weather_repository.dart';

import '../data/weather_model.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState>{
  WeatherRepository weatherRepository;

  WeatherBloc(WeatherState initialState, this.weatherRepository)
    : super(initialState){
    /// вызов состояний при исполнении события по получению данных
    on<FetchWeatherEvent>((event, emit) async {
        emit (WeatherIsLoadingState());
        Weather? weather = await weatherRepository.fetchWeatherData(event.city);
        try {
          emit (WeatherIsLoadedState(weather));
        } catch(e) {
          String error = e.toString();
          emit (WeatherIsNotLoadedState(error));
        }
      }
    );
    /// вызов состояния по очистке ранее полученных данных
    on<ClearWeatherEvent>((event, emit) async {
      emit (WeatherIsNotSearchedState());
      }
    );
  }
}
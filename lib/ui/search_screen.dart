import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_events.dart';
import 'package:weather_app_bloc/ui/constants/colors.dart';
import 'package:weather_app_bloc/ui/result_screen.dart';
import 'package:weather_app_bloc/ui/widgets/text_fields.dart';

import '../bloc/weather_states.dart';

/// главная страница -- страница поиска
class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final weatherBloc = BlocProvider.of<WeatherBloc>(context);
    var cityTextController = TextEditingController();

    return Scaffold(
      appBar: null,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        child: BlocConsumer<WeatherBloc, WeatherState>(
          builder: (context, state) {
            /// в состоянии WeatherIsNotSearchedState отображается страница
            /// с текстовым полем и кнопкой для отправки запроса
            if (state is WeatherIsNotSearchedState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "Введите название города:",
                    style: TextStyle(
                      color: primaryTextColor,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  CityTextField(
                    controller: cityTextController,
                  ),
                  SizedBox(height: 20.0,),
                  ElevatedButton(
                    onPressed: () {
                      weatherBloc.add(FetchWeatherEvent(cityTextController.text.trim()));
                    },
                    child: Text(
                      "Подтвердить",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(accentColor),
                    ),
                  )
                ],
              );
            }
            /// в состоянии WeatherIsLoadingState отображается индикатор загрузки
            else if (state is WeatherIsLoadingState) {
              return Center(child: CircularProgressIndicator());
            }
            /// в состоянии WeatherIsLoadedState открывается новая страница с полученным результатом запроса
            else if (state is WeatherIsLoadedState) {
              scheduleMicrotask(() async => await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>  ResultScreen(weather: state.fetchWeather, city: cityTextController.text.trim(),)
                ),
              ));
              weatherBloc.add(ClearWeatherEvent());
              cityTextController.clear();
            }
            /// в состоянии WeatherIsNotLoadedState появляется состояние об ошибке
            else if (state is WeatherIsNotLoadedState) {
              return Center(
                child: Text(
                  'Ошибка получения данных!',
                ),
              );
            }
          return Container();
            },
          /// вызов снекбара с текстом возникшей ошибки
          listener: (context, state){
            if (state is WeatherIsNotLoadedState){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.getError)));

            }
          }
        ),
      )
    );
  }
}

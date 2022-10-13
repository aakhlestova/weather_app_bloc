import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_bloc/ui/constants/colors.dart';
import 'package:weather_app_bloc/ui/constants/text_styles.dart';
import 'package:weather_app_bloc/ui/extra_result_screen.dart';

import '../data/weather_model.dart';


/// вторая страница приложения -- страница с результатами запроса по текущему времени
class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.city, required this.weather, }) : super(key: key);

  final Weather weather;
  final String  city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: accentColor,
          title: Text(
            "Погода на сегодня",
          ),
          actions: [
            /// кнопка перехода на третью страницу -- страницу с погодой на 3 дня
            IconButton(
              onPressed: () {
                scheduleMicrotask(() => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (blocContext) => ExtraResultScreen(weather: weather,),
                  ),
                ));
              },
              icon: Icon(Icons.list, color: Colors.white,))
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, left: 25.0, right: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Text(
                  weather.city.name,
                style: cityNameTextStyle
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Температура", style: parameterNameTextStyle,),
                  Text(weather.list[0].main.temp.toString()+" °C", style: parameterTextStyle),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Влажность", style: parameterNameTextStyle,),
                  Text(weather.list[0].main.humidity.toString() + " %", style: parameterTextStyle),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Скорость ветра", style: parameterNameTextStyle,),
                  Text(weather.list[0].wind.speed.toString()+" м/с", style: parameterTextStyle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


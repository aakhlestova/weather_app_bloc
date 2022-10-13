import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weather_app_bloc/ui/widgets/cards.dart';

import '../data/weather_model.dart';
import 'constants/colors.dart';
import 'constants/text_styles.dart';


/// третья страница приложения -- страница с результатами запроса погоды на 3 дня
class ExtraResultScreen extends StatelessWidget {
  const ExtraResultScreen({Key? key, required this.weather, }) : super(key: key);

  final Weather weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: accentColor,
          title: Text(
            "Погода на 3 дня",
          ),
          automaticallyImplyLeading: false,
          actions: [
            /// переход на главную страницу
            IconButton(
              onPressed: () {
                scheduleMicrotask(()  =>  Navigator.pop(context),
                );
              },
              icon: Icon(Icons.search, color: Colors.white,))
          ],
        ),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 25.0),
              child: Text(
                  weather.city.name,
                  style: cityNameTextStyle
              ),
            ),
            Expanded(
              child: _getCardsList(weather)
            )
          ],
        ),
    );
  }
}

/// функия генерации списка карточек с информацией на 3 дня
Widget _getCardsList(Weather weather){
  int minIndex = 0; /// индекс элемента с минимальной температурой
  double minTemp = 100; /// минимальная температура

  /// выбор элемента с минимальной температурой и его индекса
  for (int index = 0; index < weather.list.length; index++){
    if (weather.list[index].main.temp < minTemp) {
      minTemp = weather.list[index].main.temp;
      minIndex = index;
    }
  }

  var tmp = weather.list[minIndex];

  /// перенос элемента с минимальной температурой на нулевую позицию и смещение других элементов
  for (int index = minIndex; index > 0; index--){
    weather.list[index] = weather.list[index-1];
  }
  weather.list[0] = tmp;

  /// генерация карточек с информацией о погоде
  return ListView.builder(
      shrinkWrap: true,
      itemCount: weather.list.length,
      itemBuilder: (context, index) {
        var date = DateTime.fromMicrosecondsSinceEpoch(weather.list[index].dt*1000000);
        return Padding(
          padding: const EdgeInsets.only(bottom: 15.0, top: 10.0, left: 25.0, right: 25.0),
          child: WeatherInfoCard(
            date: date.toString(),
            temp: weather.list[index].main.temp.toString(),
            humidity: weather.list[index].main.humidity.toString(),
            windSpeed: weather.list[index].wind.speed.toString(),
          ),
        );
      }
  );
}

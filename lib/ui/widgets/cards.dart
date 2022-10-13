import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_bloc/ui/constants/text_styles.dart';

class WeatherInfoCard extends StatelessWidget {
  const WeatherInfoCard({Key? key, required this.date, required this.temp, required this.humidity, required this.windSpeed}) : super(key: key);

  final String date;
  final String temp;
  final String humidity;
  final String windSpeed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              blurRadius: 20.0,
              color: Colors.black12
          )
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(20.0),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Text(
            date,
            style: cardTitleTextStyle,
          ),
        ),
        subtitle: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Температура", style: cardParameterNameTextStyle,),
                  Text(temp +" °C", style: cardParameterTextStyle),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Влажность", style: cardParameterNameTextStyle,),
                  Text(humidity + " %", style: cardParameterTextStyle),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Скорость ветра", style: cardParameterNameTextStyle,),
                Text(windSpeed +" м/с", style: cardParameterTextStyle),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

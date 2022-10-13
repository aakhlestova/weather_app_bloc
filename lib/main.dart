import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_bloc.dart';
import 'package:weather_app_bloc/bloc/weather_states.dart';
import 'package:weather_app_bloc/domain/weather_repository.dart';
import 'package:weather_app_bloc/ui/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        textTheme: TextTheme(

        )
      ),
      home: SafeArea(
        child: BlocProvider(
          create: (context) => WeatherBloc(WeatherIsNotSearchedState(), WeatherRepository()),
          child: SearchScreen(),
        ),
      )
    );
  }
}

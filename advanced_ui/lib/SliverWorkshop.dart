// https://dartpad.dev/workshops.html?webserver=https://dartpad-workshops-io2021.web.app/getting_started_with_slivers

import 'package:flutter/material.dart';
import 'package:advanced_ui/classes/constant_scroll_behavior.dart';
import 'package:advanced_ui/classes/daily_forecast.dart';
import 'package:advanced_ui/classes/server.dart';
// simple forecasting app called horizons

class HorizonsApp extends StatelessWidget {
  const HorizonsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        scrollBehavior: ConstantScrollBehavior(),
        title: 'HorizonsWeather',
        home: Scaffold(
          appBar: AppBar(
            title: Text("Horizons"),
            backgroundColor: Colors.teal[800],
          ),
          body: WeeklyForecastList(),
        ));
  }
}

class WeeklyForecastList extends StatelessWidget {
  const WeeklyForecastList({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, index) {
       final DailyForecast dailyForecast = Server.getDailyForecastByID(index);
          return Card(
              child: ListTile(
            leading: Text(
              dailyForecast.getWeekday(currentDate.weekday),
              style: textTheme.headlineMedium,
            ),
            title: Text(dailyForecast.getWeekday(currentDate.weekday),
                style: textTheme.headlineSmall),
            subtitle: Text(dailyForecast.description),
            trailing: Text(
              '${dailyForecast.highTemp} | ${dailyForecast.lowTemp} F',
              style: textTheme.titleMedium,
            ),
          ));
        });
  }
}

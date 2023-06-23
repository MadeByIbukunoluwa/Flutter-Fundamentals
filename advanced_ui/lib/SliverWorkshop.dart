// https://dartpad.dev/workshops.html?webserver=https://dartpad-workshops-io2021.web.app/getting_started_with_slivers

import 'package:flutter/material.dart';

// simple forecasting app called horizons

class HorizonsApp extends StatelessWidget {
  const HorizonsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        scrollBehavior: ConstantScrollBehavior(),
        title: HorizonsWeather(),
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
    // dailyForecast = Server.getDiailyForecastByID(index),
    TextTheme textTheme = Theme.of(context).textTheme;
    return ListView.builder(
        itemCount: 7,
        itemBuilder: (BuildContext context, index) {
          return Card(
            child:ListTile(
              leading: Text(),
            )
          );
      });
  }
}

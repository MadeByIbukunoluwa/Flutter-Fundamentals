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
          // appBar: AppBar(
          //   title: Text("Horizons"),
          //   backgroundColor: Colors.teal[800],
          // ),
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                  title: Text('Horizons'),
                  backgroundColor: Colors.teal[800],
                  pinned:true,
                  expandedHeight: 200.0,
                  // floating: true,
                  // snap:true
              ),
              WeeklyForecastList(),
            ],
          )
        ));
  }
}

class WeeklyForecastList extends StatelessWidget {
  const WeeklyForecastList({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    TextTheme textTheme = Theme.of(context).textTheme;
    return SliverList(
        delegate: SliverChildBuilderDelegate(
        childCount: 7,
       (BuildContext context, index) {
          final DailyForecast dailyForecast =
              Server.getDailyForecastByID(index);
          return Card(
              child: Row(
            children: <Widget>[
              Text(dailyForecast.getWeekday(currentDate.day).toString(),
                  style: textTheme.headlineMedium),
              SizedBox(
                height: 200,
                width: 200,
                child:Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    DecoratedBox(
                      decoration: BoxDecoration(
                              gradient: RadialGradient(colors: [
                        Colors.grey[800]!,
                        Colors.transparent
                      ])),
                      child: Image.network(
                        dailyForecast.imageId,
                        fit: BoxFit.cover,
                      ),
                    ),
                Center(
                  child:Text(
                    dailyForecast.getDate(currentDate.day).toString(),
                    style: textTheme.headlineMedium,
                  )
                )
                  ],
                )
              ),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                              dailyForecast
                                  .getWeekday(currentDate.day)
                                  .toString(),
                              style: textTheme.headlineSmall),
                          Text(dailyForecast.description),
                        ],
                      ))),
              Text(
                '${dailyForecast.highTemp} | ${dailyForecast.lowTemp} F',
                style: textTheme.titleMedium,
              ),
            ],
          ));
        }));
  }
}

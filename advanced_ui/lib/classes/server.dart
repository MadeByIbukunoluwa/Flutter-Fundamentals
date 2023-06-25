import 'package:advanced_ui/SliverWorkshop.dart';
import 'package:advanced_ui/classes/daily_forecast.dart';
import "package:advanced_ui/classes/helper.dart";


class Server {
  static List getDailyForecastList() => kDummyData.values.toList();
  static DailyForecast getDailyForecastByID(int id) {
    assert(id >= 0 && id <= 6);
    return kDummyData[id]!; 
  }
}


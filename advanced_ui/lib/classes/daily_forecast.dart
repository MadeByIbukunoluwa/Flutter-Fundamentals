class DailyForecast {
  DailyForecast(
      {required this.id,
      required this.imageId,
      required this.highTemp,
      required this.lowTemp,
      required this.description});
  final int id;
  final String imageId;
  final int highTemp;
  final int lowTemp;
  final String description;

  getWeekday(int today) {
    final List<String> _weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday'
    ];
    final int offset = today + id;

    // or int day = offset >= 7 ? offset - 7 : offset

    int day = offset % 7;

    return _weekdays[day];
  }

  int getDate(int today) => today + id; 
  
}

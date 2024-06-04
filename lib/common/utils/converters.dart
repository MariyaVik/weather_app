int dateToJson(DateTime value) => value.millisecondsSinceEpoch;
DateTime dateFromJson(int value) => DateTime.fromMillisecondsSinceEpoch(value);
double fromKelvinToCelsius(double value) => value - 273.15;

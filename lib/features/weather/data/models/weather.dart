import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/common/utils/converters.dart';

import 'main_weather.dart';
import 'short_weather.dart';
import 'sys.dart';
import 'wind.dart';

part '../../../../generated/features/weather/data/models/weather.freezed.dart';
part '../../../../generated/features/weather/data/models/weather.g.dart';

@freezed
class Weather with _$Weather {
  @JsonSerializable(explicitToJson: true)
  const factory Weather({
    // @JsonKey() required double lat,
    // @JsonKey() required double lon,
    required String name,
    @JsonKey(fromJson: dateFromJson) required DateTime dt,
    required int timezone,
    @JsonKey(name: 'weather') required List<ShortWeather> shortWeather,
    @JsonKey(name: 'main') required MainWeather mainWeather,
    required Wind wind,
    @JsonKey(fromJson: cloudsFromJson) required int clouds,
    required int visibility,
    required Sys sys,
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

int cloudsFromJson(Map<String, Object?> json) {
  return json['all'] as int;
}

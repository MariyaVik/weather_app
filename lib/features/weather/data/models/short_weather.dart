import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/features/weather/data/models/short_weather.freezed.dart';
part '../../../../generated/features/weather/data/models/short_weather.g.dart';

@freezed
class ShortWeather with _$ShortWeather {
  @JsonSerializable(explicitToJson: true)
  const factory ShortWeather({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _ShortWeather;

  factory ShortWeather.fromJson(Map<String, dynamic> json) =>
      _$ShortWeatherFromJson(json);
}

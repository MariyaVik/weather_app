import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/utils/converters.dart';

part '../../../../generated/features/weather/data/models/main_weather.freezed.dart';
part '../../../../generated/features/weather/data/models/main_weather.g.dart';

@freezed
class MainWeather with _$MainWeather {
  @JsonSerializable(explicitToJson: true)
  const factory MainWeather({
    @JsonKey(fromJson: fromKelvinToCelsius) required double temp,
    @JsonKey(name: 'feels_like', fromJson: fromKelvinToCelsius)
    required double feelsLike,
    required int pressure,
    required int humidity,
    @JsonKey(name: 'temp_min', fromJson: fromKelvinToCelsius)
    required double tempMin,
    @JsonKey(name: 'temp_max', fromJson: fromKelvinToCelsius)
    required double tempMax,
    @JsonKey(name: 'sea_level') int? seaLevel,
    @JsonKey(name: 'grnd_level') int? grndLevel,
  }) = _MainWeather;

  factory MainWeather.fromJson(Map<String, dynamic> json) =>
      _$MainWeatherFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/features/weather/data/models/weather_description.freezed.dart';
part '../../../../generated/features/weather/data/models/weather_description.g.dart';

@freezed
class WeatherDescription with _$WeatherDescription {
  const factory WeatherDescription({
    required int id,
    required String main,
    required String description,
    required String icon,
  }) = _WeatherDescription;

  factory WeatherDescription.fromJson(Map<String, dynamic> json) =>
      _$WeatherDescriptionFromJson(json);
}

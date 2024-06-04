import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/features/weather/data/models/temp.freezed.dart';
part '../../../../generated/features/weather/data/models/temp.g.dart';

@freezed
class Temp with _$Temp {
  const factory Temp({
    required double day,
    required double min,
    required double max,
    required double night,
    required double eve,
    required double morn,
  }) = _Temp;

  factory Temp.fromJson(Map<String, dynamic> json) => _$TempFromJson(json);
}

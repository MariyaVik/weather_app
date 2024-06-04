import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/features/weather/data/models/fallout.freezed.dart';
part '../../../../generated/features/weather/data/models/fallout.g.dart';

@freezed
class Fallout with _$Fallout {
  @JsonSerializable(explicitToJson: true)
  const factory Fallout({
    @JsonKey(name: '1h') double? oneHour,
    @JsonKey(name: '3h') double? threeHour,
  }) = _Fallout;

  factory Fallout.fromJson(Map<String, dynamic> json) =>
      _$FalloutFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/utils/converters.dart';

part '../../../../generated/features/weather/data/models/sys.freezed.dart';
part '../../../../generated/features/weather/data/models/sys.g.dart';

@freezed
class Sys with _$Sys {
  @JsonSerializable(explicitToJson: true)
  const factory Sys({
    int? id,
    required String country,
    @JsonKey(fromJson: dateFromJson) required DateTime sunrise,
    @JsonKey(fromJson: dateFromJson) required DateTime sunset,
  }) = _Sys;

  factory Sys.fromJson(Map<String, dynamic> json) => _$SysFromJson(json);
}

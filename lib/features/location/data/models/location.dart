import 'package:freezed_annotation/freezed_annotation.dart';

part '../../../../generated/common/data/models/location.freezed.dart';
part '../../../../generated/common/data/models/location.g.dart';

@freezed
class Location with _$Location {
  const factory Location({
    required String name,
    required double lat,
    required double lon,
    required String country,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../data/models/location.dart';

part '../../../generated/features/location/cubit/location_state.freezed.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.loading() = Loading;
  const factory LocationState.loaded({
    required String selectedCity,
    required Location coordinates,
  }) = Loaded;
  const factory LocationState.cityNotSelected() = CityNotSelected;
  const factory LocationState.error(String message) = Error;
}

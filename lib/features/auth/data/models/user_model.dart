import 'package:freezed_annotation/freezed_annotation.dart';
part '../../../../generated/features/auth/data/models/user_model.freezed.dart';
part '../../../../generated/features/auth/data/models/user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required String name,
    required String surname,
    required String nickname,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) =>
      _$UserModelFromJson(json);
}

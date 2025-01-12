import 'package:freezed_annotation/freezed_annotation.dart';

part 'service_user.freezed.dart';
part 'service_user.g.dart';

@freezed
class ServiceUser with _$ServiceUser {
  const factory ServiceUser({
    required String id,
    required String name,
    required bool isSubscribed,
  }) = _ServiceUser;

  factory ServiceUser.fromJson(Map<String, dynamic> json) => _$ServiceUserFromJson(json);
}
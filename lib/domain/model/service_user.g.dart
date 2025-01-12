// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceUserImpl _$$ServiceUserImplFromJson(Map<String, dynamic> json) =>
    _$ServiceUserImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      isSubscribed: json['isSubscribed'] as bool,
    );

Map<String, dynamic> _$$ServiceUserImplToJson(_$ServiceUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'isSubscribed': instance.isSubscribed,
    };

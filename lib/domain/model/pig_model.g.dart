// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pig_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PigModelImpl _$$PigModelImplFromJson(Map<String, dynamic> json) =>
    _$PigModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      updated_at: json['updated_at'] as String?,
      created_at: json['created_at'] as String?,
      user_id: json['user_id'] as String?,
      status: $enumDecodeNullable(_$StatusEnumEnumMap, json['status']) ??
          StatusEnum.active,
    );

Map<String, dynamic> _$$PigModelImplToJson(_$PigModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'updated_at': instance.updated_at,
      'created_at': instance.created_at,
      'user_id': instance.user_id,
      'status': _$StatusEnumEnumMap[instance.status]!,
    };

const _$StatusEnumEnumMap = {
  StatusEnum.active: 'active',
  StatusEnum.inactive: 'inactive',
  StatusEnum.deleted: 'deleted',
};

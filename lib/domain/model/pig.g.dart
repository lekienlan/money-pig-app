// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PigImpl _$$PigImplFromJson(Map<String, dynamic> json) => _$PigImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      percent: json['percent'] as num?,
      balance: json['balance'] as num?,
      style:
          json['style'] as Map<String, dynamic>? ?? const <String, dynamic>{},
      updated_at: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      created_at: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      user_id: json['user_id'] as String?,
      status: $enumDecodeNullable(_$StatusEnumEnumMap, json['status']) ??
          StatusEnum.active,
    );

Map<String, dynamic> _$$PigImplToJson(_$PigImpl instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'percent': instance.percent,
      'balance': instance.balance,
      'style': instance.style,
      'updated_at': instance.updated_at?.toIso8601String(),
      'created_at': instance.created_at?.toIso8601String(),
      'user_id': instance.user_id,
      'status': _$StatusEnumEnumMap[instance.status]!,
    };

const _$StatusEnumEnumMap = {
  StatusEnum.active: 'active',
  StatusEnum.inactive: 'inactive',
  StatusEnum.deleted: 'deleted',
};

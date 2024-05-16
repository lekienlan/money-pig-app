// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pig_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PigCardModelImpl _$$PigCardModelImplFromJson(Map<String, dynamic> json) =>
    _$PigCardModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      budget: json['budget'] as num?,
      start_date: json['start_date'] as String?,
      end_date: json['end_date'] as String?,
      updated_at: json['updated_at'] as String?,
      created_at: json['created_at'] as String?,
      user_id: json['user_id'] as String?,
      status: $enumDecodeNullable(_$StatusEnumEnumMap, json['status']) ??
          StatusEnum.active,
    );

Map<String, dynamic> _$$PigCardModelImplToJson(_$PigCardModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'budget': instance.budget,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
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

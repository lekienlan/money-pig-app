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
      period_id: json['period_id'] as String?,
      start_date: json['start_date'] as String?,
      end_date: json['end_date'] as String?,
      budget: json['budget'] as num?,
      expense: json['expense'] as num?,
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
      'period_id': instance.period_id,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'budget': instance.budget,
      'expense': instance.expense,
      'status': _$StatusEnumEnumMap[instance.status]!,
    };

const _$StatusEnumEnumMap = {
  StatusEnum.active: 'active',
  StatusEnum.inactive: 'inactive',
  StatusEnum.deleted: 'deleted',
};

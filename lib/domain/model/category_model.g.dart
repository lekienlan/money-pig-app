// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryModelImpl _$$CategoryModelImplFromJson(Map<String, dynamic> json) =>
    _$CategoryModelImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
      type: $enumDecodeNullable(_$TransactionTypeEnumEnumMap, json['type']),
      created_at: json['created_at'] as String?,
      updated_at: json['updated_at'] as String?,
      style: json['style'] == null
          ? null
          : StyleModel.fromJson(json['style'] as Map<String, dynamic>),
      status: $enumDecodeNullable(_$StatusEnumEnumMap, json['status']) ??
          StatusEnum.active,
    );

Map<String, dynamic> _$$CategoryModelImplToJson(_$CategoryModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
      'type': _$TransactionTypeEnumEnumMap[instance.type],
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
      'style': instance.style,
      'status': _$StatusEnumEnumMap[instance.status]!,
    };

const _$TransactionTypeEnumEnumMap = {
  TransactionTypeEnum.budget: 'budget',
  TransactionTypeEnum.expense: 'expense',
  TransactionTypeEnum.income: 'income',
};

const _$StatusEnumEnumMap = {
  StatusEnum.active: 'active',
  StatusEnum.inactive: 'inactive',
  StatusEnum.deleted: 'deleted',
};

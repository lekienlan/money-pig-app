// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionModelImpl _$$TransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionModelImpl(
      id: json['id'] as String?,
      amount: json['amount'] as num?,
      type: $enumDecodeNullable(_$TransactionTypeEnumEnumMap, json['type']),
      created_at: json['created_at'] as String?,
      status: $enumDecodeNullable(_$StatusEnumEnumMap, json['status']) ??
          StatusEnum.active,
    );

Map<String, dynamic> _$$TransactionModelImplToJson(
        _$TransactionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'type': _$TransactionTypeEnumEnumMap[instance.type],
      'created_at': instance.created_at,
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

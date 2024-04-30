import 'package:freezed_annotation/freezed_annotation.dart';

part 'pig.freezed.dart';
part 'pig.g.dart';

@freezed
abstract class Pig with _$Pig {
  const factory Pig({
    String? id,
    String? name,
    num? percent,
    num? balance,
    @Default(<String, dynamic>{}) Map<String, dynamic>? style,
    DateTime? updated_at,
    DateTime? created_at,
    String? user_id,
    @Default(StatusEnum.active) StatusEnum status,
  }) = _Pig;

  factory Pig.fromJson(Map<String, dynamic> json) => _$PigFromJson(json);
}

enum StatusEnum {
  active,
  inactive,
  deleted
  // Add other statuses here if needed
}

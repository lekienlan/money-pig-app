import 'package:freezed_annotation/freezed_annotation.dart';

part 'style_model.freezed.dart';
part 'style_model.g.dart';

@freezed
abstract class StyleModel with _$StyleModel {
  const factory StyleModel({
    String? icon,
    String? color,
    String? backgroundColor,
  }) = _StyleModel;

  factory StyleModel.fromJson(Map<String, dynamic> json) =>
      _$StyleModelFromJson(json);
}

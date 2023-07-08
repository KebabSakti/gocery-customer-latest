import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gocery/model/pagination/pagination_model.dart';

part 'option_model.freezed.dart';
part 'option_model.g.dart';

@freezed
class OptionModel with _$OptionModel {
  const factory OptionModel({
    Map<String, String>? extra,
    PaginationModel? pagination,
  }) = _OptionModel;

  factory OptionModel.fromJson(Map<String, dynamic> json) =>
      _$OptionModelFromJson(json);
}

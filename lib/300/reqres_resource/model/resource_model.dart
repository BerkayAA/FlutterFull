import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource_model.g.dart';

String _fetchCustom(String fromJson) {
  return 'aa';
}

@JsonSerializable()
class ResourceModel {
  List<Data>? data;

  ResourceModel({this.data});

  factory ResourceModel.fromJson(Map<String, dynamic> json) {
    return _$ResourceModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResourceModelToJson(this);
  }
}

@JsonSerializable()
class Data extends Equatable {
  final int? id;
  final String? name;
  final int? year;
  final String? color;
  @JsonKey(fromJson: _fetchCustom)
  final String? pantoneValue;
  final String? price;
  final StatusCode? status;

  const Data({this.id, this.name, this.year, this.color, this.pantoneValue, this.price, this.status});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }

  @override
  List<Object?> get props => [name, price, id];
}

enum StatusCode {
  @JsonValue(200)
  success,
  @JsonValue(500)
  weird
}

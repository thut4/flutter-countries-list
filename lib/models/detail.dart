import 'package:json_annotation/json_annotation.dart';

part 'detail.g.dart';

@JsonSerializable()
class Detail {
  String name;
  String region;
  String subregion;
  int population;
  String demonym;
  String alpha2Code;

  Detail(
      {required this.name,
      required this.region,
      required this.subregion,
      required this.population,
      required this.demonym,
      required this.alpha2Code});

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
}

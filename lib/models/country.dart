import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:retrofit/http.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  String name;
  String region;
  String alpha2Code;
  Country({required this.name, required this.region, required this.alpha2Code});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
}

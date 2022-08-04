// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      name: json['name'] as String,
      region: json['region'] as String,
      subregion: json['subregion'] as String,
      population: json['population'] as int,
      demonym: json['demonym'] as String,
      alpha2Code: json['alpha2Code'] as String,
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'subregion': instance.subregion,
      'population': instance.population,
      'demonym': instance.demonym,
      'alpha2Code': instance.alpha2Code,
    };

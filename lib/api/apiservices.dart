import 'package:flutter_country/models/country.dart';
import 'package:flutter_country/models/detail.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'apiservices.g.dart';

@RestApi(baseUrl: 'https://restcountries.com/v2/')
abstract class ApiServices {
  factory ApiServices(Dio dio) = _ApiServices;

  @GET('all')
  Future<List<Country>> getCountries();
  @GET('name/{name}?fullText=true')
  Future<List<Detail>> getDetail(@Path() String name);
}

import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../models/country.dart';
import '../models/detail.dart';

part 'apiservices.g.dart';

@RestApi(baseUrl: 'https://restcountries.com/v2/')
abstract class ApiServices {
  factory ApiServices(Dio dio) = _ApiServices;
  @GET('all')
  Future<List<Country>> getCountries();
  @GET('name/{name}?fullText=true')
  Future<List<Detail>> getDetail(@Path() String name);
}

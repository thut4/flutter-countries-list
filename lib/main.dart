import 'package:dio_flutter_transformer2/dio_flutter_transformer2.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country/api/apiservices.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'views/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dio dio = Dio();
    // dio.interceptors.add(
    //     DioCacheManager(CacheConfig(baseUrl: 'https://restcountries.com/v2/'))
    //         .interceptor);
    dio.transformer = FlutterTransformer();
    dio.interceptors.add(LogInterceptor(
      responseBody: true,
      logPrint: (log) => print(log),
    ));
    ApiServices apiServices = ApiServices(dio);
    Get.put(apiServices);
    return GetMaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

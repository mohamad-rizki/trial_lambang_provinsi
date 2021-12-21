import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:get/get.dart';

import '../entity/province.dart';
import '../mapper/province_mapper.dart';

class ProvinceController extends GetxController
    with StateMixin<List<Province>> {
  @override
  void onInit() {
    super.onInit();
    fetchProvince();
  }

  void fetchProvince() async {
    try {
      final dio = _getDio();
      final response = await dio.get("/list/symbols/province/200");
      if (response.statusCode == HttpStatus.ok) {
        final resultList = ProvinceMapper.fromJson(response.data);
        change(resultList, status: RxStatus.success());
      } else {
        change(null, status: RxStatus.error("Empty data"));
      }
    } on DioError catch (e) {
      change(null, status: RxStatus.error(e.message));
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Dio _getDio() {
    BaseOptions options = BaseOptions(
      baseUrl: "https://feriirawan-api.herokuapp.com",
      connectTimeout: 10000,
      receiveTimeout: 10000,
    );
    final dio = Dio(options);
    dio.interceptors.add(_setupHeader(dio));
    dio.interceptors.add(_setupLogger());
    return dio;
  }

  Interceptor _setupHeader(Dio dio) {
    return InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers[HttpHeaders.acceptHeader] = ContentType.json;
      // options.headers["Access-Control-Allow-Origin"] = "*";
      // options.headers["Access-Control-Allow-Credentials"] = "true";
      // options.headers["Access-Control-Allow-Headers"] = "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
      // options.headers["Access-Control-Allow-Methods"] = "GET, PUT, POST, OPTIONS";
      return handler.next(options);
    });
  }

  Interceptor _setupLogger() {
    return LogInterceptor(
      request: _isDebugMode(),
      requestHeader: _isDebugMode(),
      requestBody: _isDebugMode(),
      responseBody: _isDebugMode(),
      error: _isDebugMode(),
    );
  }

  bool _isDebugMode() {
    return kDebugMode;
  }
}

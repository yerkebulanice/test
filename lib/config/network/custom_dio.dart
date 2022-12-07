import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:test_task/core/service_locator.dart';
part 'custom_auth_dio.dart';

class CustomDio extends ServiceLocator {
  final String backendUrl;
  final Dio dio = Dio();

  CustomDio({required this.backendUrl});

  BaseOptions get getBaseOptions {
    return BaseOptions(
      baseUrl: backendUrl,
      receiveTimeout: 30000,
      connectTimeout: 30000,
      contentType: "application/json",
    );
  }

  dynamic onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    print('RESPONSE::  URI: ${response.data}');
    if (response.statusCode != 200) {
      throw 'Error: ${response.statusCode}';
    }
  }

  set baseUrl(String url) {
    dio.options.baseUrl = url;
  }

  String get baseUrl => dio.options.baseUrl;

  @override
  Future<void> call(GetIt sl) async {
    sl.registerLazySingleton(() => this);
  }
}

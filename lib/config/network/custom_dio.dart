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
    print('RESPONSE: ${response.data}');
    if ((response.data as Map)['status'] == 'ok') {
      // success
      if ((response.data as Map)['data'] == null) {
        response.data = [];
      } else {
        response.data = (response.data as Map)['data'];
      }

      return handler.next(response);
    } else {
      return handler.next(response);
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

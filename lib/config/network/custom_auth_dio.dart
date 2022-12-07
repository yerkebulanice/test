part of 'custom_dio.dart';

class CustomAuthDio extends CustomDio {
  CustomAuthDio({required super.backendUrl}) {
    dio.options = getBaseOptions;

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: onRequest,
        onResponse: onResponse,
      ),
    );
  }

  dynamic onRequest(
    RequestOptions requestOptions,
    RequestInterceptorHandler handler,
  ) {
    print('URL' + requestOptions.baseUrl);
    return handler.next(requestOptions);
  }

  @override
  Future<void> call(GetIt sl) async {
    sl.registerLazySingleton<CustomAuthDio>(() => this);
  }
}

part of 'custom_dio.dart';

class CustomAuthDio extends CustomDio {
  CustomAuthDio({required super.backendUrl}) {
    print('BACKEND URL: $backendUrl');
    print('BACKEND URL: $getBaseOptions');
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
    print('DATA: ${requestOptions.data}');
    print('URL: ${requestOptions.path}');
    requestOptions.headers = {
      "Content-Type": "application/json",
      "accept": "application/json",
    };
    return handler.next(requestOptions);
  }

  @override
  Future<void> call(GetIt sl) async {
    sl.registerLazySingleton<CustomAuthDio>(() => this);
  }
}

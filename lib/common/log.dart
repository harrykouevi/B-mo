import 'package:dio/dio.dart' as dio;

/// [LogInterceptor] is used to print logs during network requests.
/// It's better to add [LogInterceptor] to the tail of the interceptor queue,
/// otherwise the changes made in the interceptor behind A will not be printed out.
/// This is because the execution of interceptors is in the order of addition.
class LogInterceptor extends dio.LogInterceptor {
  bool response;

  LogInterceptor({
    this.response = false,
    super.request = true,
    super.requestHeader = false,
    super.requestBody = false,
    super.responseHeader = false,
    super.responseBody = false,
    super.error = true,
    super.logPrint = print,
  });

  @override
  void onRequest(dio.RequestOptions options, dio.RequestInterceptorHandler handler) async {
    if (request) {
      logPrint('*** Request ***');
      _printKV('uri', Uri.decodeFull(options.uri.toString()));
      _printKV('method', options.method);
    }
    if (requestHeader) {
      _printKV('responseType', options.responseType.toString());
      _printKV('followRedirects', options.followRedirects);
      _printKV('connectTimeout', options.connectTimeout);
      _printKV('sendTimeout', options.sendTimeout);
      _printKV('receiveTimeout', options.receiveTimeout);
      _printKV('receiveDataWhenStatusError', options.receiveDataWhenStatusError);
      _printKV('extra', options.extra);
    }
    if (requestHeader) {
      logPrint('headers:');
      options.headers.forEach((key, v) => _printKV(' $key', v));
    }
    if (requestBody) {
      logPrint('data:');
      _printAll(options.data);
    }
    if (request) {
      logPrint('');
    }

    handler.next(options);
  }

  @override
  void onResponse(dio.Response response, dio.ResponseInterceptorHandler handler) async {
    _printResponse(response);
    handler.next(response);
  }

  @override
  void onError(dio.DioError err, dio.ErrorInterceptorHandler handler) async {
    if (error) {
      logPrint('*** DioError ***:');
      logPrint('uri: ${Uri.decodeFull(err.requestOptions.uri.toString())}');
      logPrint('$err');
      if (err.response != null) {
        _printResponse(err.response!);
      }
      logPrint('');
    }

    handler.next(err);
  }

  void _printResponse(dio.Response response) {
    if (this.response) {
      logPrint('*** Response ***');
      _printKV('uri', Uri.decodeFull(response.requestOptions.uri.toString()));
    }
    if (responseHeader) {
      _printKV('statusCode', response.statusCode);
      if (response.isRedirect == true) {
        _printKV('redirect', response.realUri);
      }

      logPrint('headers:');
      response.headers.forEach((key, v) => _printKV(' $key', v.join('\r\n\t')));
    }
    if (responseBody) {
      logPrint('Response Text:');
      _printAll(response.toString());
    }
    if (this.response) {
      logPrint('');
    }
  }

  void _printKV(String key, Object? v) {
    logPrint('$key: $v');
  }

  void _printAll(msg) {
    msg.toString().split('\n').forEach(logPrint);
  }
}

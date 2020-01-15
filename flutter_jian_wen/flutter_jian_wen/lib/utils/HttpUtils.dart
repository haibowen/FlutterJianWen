import 'package:dio/dio.dart';

class HttpUtils {
  static const BASE_URL =
      'http://v.juhe.cn/toutiao/index?type=keji&key=27d98876a75e6fb3f9eac28f71d807a0';
  static const CONNECT_TIMEOUT = 5000;
  static const RECEIVE_TIMEOUT = 3000;
  static Dio dio;

  /// 生成Dio实例
  static Dio getInstance() {
    if (dio == null) {
      //通过传递一个 `BaseOptions`来创建dio实例
      var options = BaseOptions(
          baseUrl: BASE_URL,
          connectTimeout: CONNECT_TIMEOUT,
          receiveTimeout: RECEIVE_TIMEOUT);
      dio = new Dio(options);
    }
    return dio;
  }

  /// 请求api
  static Future<Map> request(String url, {method}) async {
    method = method ?? "get";

    var dio = getInstance();
    var res;
    if (method == "get") {
      // get
      var response = await dio.get(url);
      res = response.data;
    } else {
      // post
      var response = await dio.post(url);
      res = response.data;
    }
    return res;
  }

  /// get
  static Future<Map> get(url) => request(url);

  /// post
  static Future<Map> post(url) => request(url, method: "post");
}

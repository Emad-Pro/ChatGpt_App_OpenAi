import 'package:chatgpt_app_openai/core/constans.dart';
import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() async {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.openai.com/v1/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? qurey,
      Map<String, dynamic>? data}) async {
    print("test");
    dio!.options.headers = {
      "Authorization": "Bearer apikey",
      'Content-Type': 'application/json',
    };

    return dio!.post(url, queryParameters: qurey, data: data);
  }
}

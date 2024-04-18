// ignore_for_file: file_names

import 'package:dio/dio.dart';

abstract class FaliureErorr {
  final String erorrMessage;

  FaliureErorr(this.erorrMessage);
}

class ServerFaliureErorr extends FaliureErorr {
  ServerFaliureErorr(super.erorrMessage);
  factory ServerFaliureErorr.fromDioErorr(DioException dioErorr) {
    switch (dioErorr.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFaliureErorr("انتهت مهلة الاتصال بخادم API");
      case DioExceptionType.sendTimeout:
        return ServerFaliureErorr("انتهاء مهلة الإرسال باستخدام خادم Api");
      case DioExceptionType.receiveTimeout:
        return ServerFaliureErorr("إنهاء مهلة الاستلام مع خادم API");
      case DioExceptionType.badResponse:
        return ServerFaliureErorr.fromResponse(
            dioErorr.response!.statusCode!, dioErorr.response);
      case DioExceptionType.cancel:
        return ServerFaliureErorr("تم إلغاء الطلب إلى خادم API");

      case DioExceptionType.unknown:
        if (dioErorr.message!.contains('SocketException')) {
          return ServerFaliureErorr("لا يوجد اتصال بالإنترنت");
        }
        return ServerFaliureErorr("خطأ غير متوقع، برجاء العودة مرة أخرى!");
      default:
        return ServerFaliureErorr(
            "انتبه، لقد كان هناك خطأ ما تأكد من اتصال الانترنت وإعد المحاولة");
    }
  }
  factory ServerFaliureErorr.fromResponse(int stutusCode, dynamic response) {
    if (stutusCode == 401) {
      return ServerFaliureErorr(response);
    } else if (stutusCode == 429) {
      return ServerFaliureErorr(
          "You exceeded your current quota, please check your plan and billing details");
    } else if (stutusCode == 501) {
      return ServerFaliureErorr(
          "The engine is currently overloaded, please try again later");
    } else {
      return ServerFaliureErorr("Opps There Was am Erorr");
    }
  }
}

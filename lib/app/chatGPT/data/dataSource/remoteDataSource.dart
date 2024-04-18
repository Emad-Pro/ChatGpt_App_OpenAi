import 'package:chatgpt_app_openai/app/chatGPT/data/model/chatGptOpenAiModel.dart';
import 'package:chatgpt_app_openai/dio_helper.dart';
import 'package:chatgpt_app_openai/services/erorr/Exception.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class BaseRemoteDataSourceChatGptOpenAi {
  Future<Either<FaliureErorr, ChatGptOpenAiModel>> fetchDataChatGptOpenAi(
      String text);
}

class RemoteDataSourceChatGptOpenAi extends BaseRemoteDataSourceChatGptOpenAi {
  @override
  Future<Either<FaliureErorr, ChatGptOpenAiModel>> fetchDataChatGptOpenAi(
      String text) async {
    try {
      final response = await DioHelper.postData(url: "chat/completions", data: {
        "model": "gpt-3.5-turbo",
        "messages": [
          {
            "role": "user",
            "content": text,
          }
        ]
      });
      return Right(ChatGptOpenAiModel.fromJson(response.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliureErorr.fromDioErorr(e));
      } else {
        return Left(ServerFaliureErorr(e.toString()));
      }
    }
  }
}

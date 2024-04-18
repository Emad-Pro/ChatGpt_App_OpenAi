import "package:chatgpt_app_openai/app/dall-E/data/model/dall-E_Model.dart";

import "package:chatgpt_app_openai/dio_helper.dart";
import "package:dartz/dartz.dart";

import "package:dio/dio.dart";

import "../../../../services/erorr/Exception.dart";

abstract class BaseRemoteDataSourceDallEOpenAi {
  Future<Either<FaliureErorr, DallEModel>> fetchDallEOpenAi(String prompt);
}

class RemoteDataSourceDallEOpenAi extends BaseRemoteDataSourceDallEOpenAi {
  @override
  Future<Either<FaliureErorr, DallEModel>> fetchDallEOpenAi(
      String prompt) async {
    try {
      final response = await DioHelper.postData(
        url: "images/generations",
        data: {
          "model": "dall-e-3",
          "prompt": prompt,
          "n": 1,
          "size": "1024x1024"
        },
      );

      return Right(DallEModel.fromJson(response.data));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFaliureErorr.fromDioErorr(e));
      } else {
        return Left(ServerFaliureErorr(e.toString()));
      }
    }
  }
}

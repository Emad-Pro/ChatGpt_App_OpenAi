import 'package:chatgpt_app_openai/app/dall-E/data/dataSource/remoteDataSource.dart';

import 'package:chatgpt_app_openai/app/dall-E/data/model/dall-E_Model.dart';
import 'package:chatgpt_app_openai/app/dall-E/domin/repository/baseDallEOpenAiRepository.dart';
import 'package:chatgpt_app_openai/services/erorr/Exception.dart';

import 'package:dartz/dartz.dart';

class DallEOpenAiRepoistory extends BaseDallEOpenAiRepoistory {
  final BaseRemoteDataSourceDallEOpenAi baseRemoteDataSourceDallEOpenAi;

  DallEOpenAiRepoistory(this.baseRemoteDataSourceDallEOpenAi);
  @override
  Future<Either<FaliureErorr, DallEModel>> getDallEOpenAi(String prompt) async {
    return await baseRemoteDataSourceDallEOpenAi.fetchDallEOpenAi(prompt);
  }
}

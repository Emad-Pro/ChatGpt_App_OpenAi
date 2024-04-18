import 'package:chatgpt_app_openai/app/dall-E/data/model/dall-E_Model.dart';
import 'package:chatgpt_app_openai/app/dall-E/domin/repository/baseDallEOpenAiRepository.dart';
import 'package:chatgpt_app_openai/services/erorr/Exception.dart';

import 'package:dartz/dartz.dart';

abstract class BaseDallEOpenAiUseCases {
  Future<Either<FaliureErorr, DallEModel>> getDallEOpenAiUseCaces(
      String prompt);
}

class DallEOpenAiUseCases extends BaseDallEOpenAiUseCases {
  final BaseDallEOpenAiRepoistory baseDallEOpenAiRepoistory;

  DallEOpenAiUseCases(this.baseDallEOpenAiRepoistory);
  @override
  Future<Either<FaliureErorr, DallEModel>> getDallEOpenAiUseCaces(
      String prompt) async {
    return await baseDallEOpenAiRepoistory.getDallEOpenAi(prompt);
  }
}

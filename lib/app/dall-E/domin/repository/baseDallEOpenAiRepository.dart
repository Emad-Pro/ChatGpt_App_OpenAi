import 'package:chatgpt_app_openai/app/dall-E/data/model/dall-E_Model.dart';
import 'package:chatgpt_app_openai/services/erorr/Exception.dart';

import 'package:dartz/dartz.dart';

abstract class BaseDallEOpenAiRepoistory {
  Future<Either<FaliureErorr, DallEModel>> getDallEOpenAi(String prompt);
}

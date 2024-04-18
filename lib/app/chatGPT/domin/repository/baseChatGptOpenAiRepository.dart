// ignore_for_file: file_names

import 'package:chatgpt_app_openai/app/chatGPT/data/model/chatGptOpenAiModel.dart';
import 'package:chatgpt_app_openai/services/erorr/Exception.dart';
import 'package:chatgpt_app_openai/services/erorr/Failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseChatGptOpenAiRepository {
  Future<Either<FaliureErorr, ChatGptOpenAiModel>> getChatGptOpenAi(
      String prompt);
}

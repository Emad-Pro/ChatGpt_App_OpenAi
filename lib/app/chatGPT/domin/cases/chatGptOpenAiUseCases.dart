import 'package:chatgpt_app_openai/app/chatGPT/data/model/chatGptOpenAiModel.dart';
import 'package:chatgpt_app_openai/app/chatGPT/domin/repository/baseChatGptOpenAiRepository.dart';
import 'package:chatgpt_app_openai/services/erorr/Exception.dart';

import 'package:chatgpt_app_openai/services/erorr/Failure.dart';
import 'package:dartz/dartz.dart';

abstract class BaseChatGptOpenAiUseCases {
  Future<Either<FaliureErorr, ChatGptOpenAiModel>> getArtPromptUseCases(
      String prompt);
}

class ChatGptOpenAiUseCases extends BaseChatGptOpenAiUseCases {
  final BaseChatGptOpenAiRepository baseChatGptOpenAiRepository;

  ChatGptOpenAiUseCases(this.baseChatGptOpenAiRepository);
  @override
  Future<Either<FaliureErorr, ChatGptOpenAiModel>> getArtPromptUseCases(
      String prompt) async {
    return await baseChatGptOpenAiRepository.getChatGptOpenAi(prompt);
  }
}

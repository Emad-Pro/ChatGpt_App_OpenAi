import 'package:chatgpt_app_openai/app/chatGPT/data/dataSource/remoteDataSource.dart';
import 'package:chatgpt_app_openai/app/chatGPT/data/model/chatGptOpenAiModel.dart';
import 'package:chatgpt_app_openai/app/chatGPT/domin/repository/baseChatGptOpenAiRepository.dart';

import 'package:chatgpt_app_openai/services/erorr/Exception.dart';

import 'package:dartz/dartz.dart';

class ChatGptOpenAiRepository extends BaseChatGptOpenAiRepository {
  final BaseRemoteDataSourceChatGptOpenAi baseRemoteDataSourceChatGptOpenAi;

  ChatGptOpenAiRepository(this.baseRemoteDataSourceChatGptOpenAi);
  @override
  Future<Either<FaliureErorr, ChatGptOpenAiModel>> getChatGptOpenAi(
      String prompt) async {
    return await baseRemoteDataSourceChatGptOpenAi
        .fetchDataChatGptOpenAi(prompt);
  }
}

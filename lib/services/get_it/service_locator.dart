import 'package:chatgpt_app_openai/app/chatGPT/data/dataSource/remoteDataSource.dart';
import 'package:chatgpt_app_openai/app/chatGPT/data/repository/chatGptOpenAiRepository.dart';
import 'package:chatgpt_app_openai/app/chatGPT/domin/cases/chatGptOpenAiUseCases.dart';
import 'package:chatgpt_app_openai/app/chatGPT/domin/repository/baseChatGptOpenAiRepository.dart';
import 'package:chatgpt_app_openai/app/dall-E/data/dataSource/remoteDataSource.dart';
import 'package:chatgpt_app_openai/app/dall-E/data/repository/dallEOpenAiRepoistory.dart';
import 'package:chatgpt_app_openai/app/dall-E/domin/cases/dallEOpenAiUseCases.dart';
import 'package:chatgpt_app_openai/app/dall-E/domin/repository/baseDallEOpenAiRepository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

class ServiceLocator {
  void init() {
    getIt.registerLazySingleton<BaseChatGptOpenAiRepository>(
        () => ChatGptOpenAiRepository(getIt()));
    getIt.registerLazySingleton<BaseRemoteDataSourceChatGptOpenAi>(
        () => RemoteDataSourceChatGptOpenAi());
    getIt.registerLazySingleton(() => ChatGptOpenAiUseCases(getIt()));

    getIt.registerLazySingleton<BaseDallEOpenAiRepoistory>(
        () => DallEOpenAiRepoistory(getIt()));
    getIt.registerLazySingleton<BaseRemoteDataSourceDallEOpenAi>(
        () => RemoteDataSourceDallEOpenAi());
    getIt.registerLazySingleton<BaseDallEOpenAiUseCases>(
        () => DallEOpenAiUseCases(getIt()));
  }
}

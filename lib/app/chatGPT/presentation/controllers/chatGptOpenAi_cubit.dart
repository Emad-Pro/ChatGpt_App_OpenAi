import 'dart:async';
import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:chatgpt_app_openai/app/chatGPT/domin/cases/chatGptOpenAiUseCases.dart';

import 'package:chatgpt_app_openai/app/chatGPT/presentation/controllers/chatGptOpenAi_state.dart';

import 'package:chatgpt_app_openai/services/enum.dart';
import 'package:chatgpt_app_openai/services/shared_preferences/CacheHelper.dart';
import 'package:dash_chat_2/dash_chat_2.dart';

class ChatGptOpenAiCubit extends Cubit<ChatGptOpenAiState> {
  ChatGptOpenAiCubit(this.chatGptOpenAiUseCases)
      : super(const ChatGptOpenAiState());
  List<ChatMessage> messages = [];
  final ChatGptOpenAiUseCases chatGptOpenAiUseCases;
  List<ChatUser> typingList = [];
  Future<void> setMessagesToList({String? text, required ChatUser user}) async {
    messages
        .add(ChatMessage(user: user, createdAt: DateTime.now(), text: text!));

    cachedMessageData();
    if (user.id == "1") {
      sendChatGptOpenAiMessage(text);
    }
  }

  Future<void> cachedMessageData() async {
    List<String> messagesList =
        messages.map((item) => json.encode(item.toJson())).toList();
    await CacheHelper.save("talkeChatGpt", messagesList);
  }

  Future<void> getDataMessagesChat() async {
    List<String> messagesEa = await CacheHelper.read("talkeChatGpt");
    messages = messagesEa
        .map((item) => ChatMessage.fromJson(json.decode(item)))
        .toList();
  }

  Future<void> sendChatGptOpenAiMessage(String prompt) async {
    emit(const ChatGptOpenAiState(
        chatGptOpenAiState: RequestState.loadingState));
    final reslut = await chatGptOpenAiUseCases.getArtPromptUseCases(prompt);
    reslut.fold(
        (l) => emit(ChatGptOpenAiState(
            chatGptOpenAiMessage: l.erorrMessage,
            chatGptOpenAiState: RequestState.erorrState)),
        (r) => emit(ChatGptOpenAiState(
            chatGptOpenAiModel: r,
            chatGptOpenAiState: RequestState.successState)));
  }
}

import 'package:chatgpt_app_openai/app/chatGPT/data/model/chatGptOpenAiModel.dart';
import 'package:chatgpt_app_openai/app/chatGPT/domin/entites/chatMessageModel.dart';

import 'package:chatgpt_app_openai/services/enum.dart';
import 'package:equatable/equatable.dart';

class ChatGptOpenAiState extends Equatable {
  final ChatGptOpenAiModel? chatGptOpenAiModel;
  final RequestState chatGptOpenAiState;
  final String chatGptOpenAiMessage;
  ////////////////////////////////////////////////////
  final List<ChatMessage>? chachedchatGptOpenAiListModel;
  final RequestState? chachedchatGptOpenAiState;
///////////////////////////////////////////////////////////////
  final RequestState messagesToListState;
  const ChatGptOpenAiState(
      {this.chatGptOpenAiModel,
      this.chatGptOpenAiState = RequestState.loadingState,
      this.chatGptOpenAiMessage = "",
      ////////////////////////////////////////////////////////////////
      this.chachedchatGptOpenAiListModel,
      this.chachedchatGptOpenAiState = RequestState.loadingState,
      this.messagesToListState = RequestState.loadingState});
  ChatGptOpenAiState copyWith({
    ChatGptOpenAiModel? chatGptOpenAiModel,
    RequestState? chatGptOpenAiState,
    String? chatGptOpenAiMessage,

    //////////////////////////////////
    List<ChatMessage>? chachedchatGptOpenAiListModel,
    RequestState? chachedchatGptOpenAiState,
    //////////////////////////////////////////
    RequestState? messagesToListState,
  }) {
    return ChatGptOpenAiState(
        chatGptOpenAiModel: chatGptOpenAiModel ?? this.chatGptOpenAiModel,
        chatGptOpenAiState: chatGptOpenAiState ?? this.chatGptOpenAiState,
        chatGptOpenAiMessage: chatGptOpenAiMessage ?? this.chatGptOpenAiMessage,
        //////////////////////////////////////
        chachedchatGptOpenAiListModel:
            chachedchatGptOpenAiListModel ?? this.chachedchatGptOpenAiListModel,
        chachedchatGptOpenAiState:
            chachedchatGptOpenAiState ?? this.chachedchatGptOpenAiState,
        ////////////////////////////////////////////////////
        messagesToListState: messagesToListState ?? this.messagesToListState);
  }

  @override
  List<Object?> get props => [
        chatGptOpenAiModel,
        chatGptOpenAiState,
        chatGptOpenAiMessage,
        ////////////////////////////////////////////
        chachedchatGptOpenAiListModel,
        chachedchatGptOpenAiState,
        ///////////////////////////////////////////
        messagesToListState,
      ];
}

import 'package:chatgpt_app_openai/app/chatGPT/presentation/controllers/chatGptOpenAi_cubit.dart';
import 'package:chatgpt_app_openai/app/chatGPT/presentation/controllers/chatGptOpenAi_state.dart';
import 'package:chatgpt_app_openai/core/palleteColors.dart';

import 'package:chatgpt_app_openai/services/enum.dart';
import 'package:chatgpt_app_openai/services/mysetting.dart';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Talke Chat Gpt",
          style: TextStyle(
              fontFamily: "cera pro",
              fontSize: 18,
              color: Pallete.mainFontColor),
        ),
      ),
      body: BlocConsumer<ChatGptOpenAiCubit, ChatGptOpenAiState>(
        listener: (context, state) {
          if (state.chatGptOpenAiState == RequestState.loadingState) {
            BlocProvider.of<ChatGptOpenAiCubit>(context)
                .typingList
                .add(ChatUser(id: "2", firstName: "Ai", lastName: "Chat-Gpt"));
          }
          if (state.chatGptOpenAiState == RequestState.successState) {
            BlocProvider.of<ChatGptOpenAiCubit>(context).setMessagesToList(
              text: state.chatGptOpenAiModel!.choices![0].message!.content!,
              user: ChatUser(id: "2", firstName: "Ai", lastName: "Chat-Gpt"),
            );
            BlocProvider.of<ChatGptOpenAiCubit>(context).typingList.clear();
          }
          if (state.chatGptOpenAiState == RequestState.erorrState) {
            showToast(state.chatGptOpenAiMessage,
                context: context,
                duration: Duration(seconds: 3),
                position: StyledToastPosition.top,
                backgroundColor: Colors.red);

            BlocProvider.of<ChatGptOpenAiCubit>(context).messages.remove(
                BlocProvider.of<ChatGptOpenAiCubit>(context).messages.last);
            BlocProvider.of<ChatGptOpenAiCubit>(context).typingList.clear();
          }
        },
        builder: (context, state) {
          return DashChat(
            typingUsers:
                BlocProvider.of<ChatGptOpenAiCubit>(context).typingList,
            messageListOptions: MessageListOptions(),
            inputOptions: InputOptions(),
            messageOptions: const MessageOptions(
                showCurrentUserAvatar: true, showTime: true),
            currentUser: MySetting.user!,
            onSend: (ChatMessage e) {
              BlocProvider.of<ChatGptOpenAiCubit>(context).setMessagesToList(
                user: MySetting.user!,
                text: e.text,
              );
            },
            messages: BlocProvider.of<ChatGptOpenAiCubit>(context)
                .messages
                .reversed
                .toList(),
          );
        },
      ),
    );
  }
}

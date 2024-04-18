import 'package:chatgpt_app_openai/app/chatGPT/domin/entites/chatMessageModel.dart';
import 'package:chatgpt_app_openai/app/chatGPT/presentation/widget/ChatMessageWidget.dart';
import 'package:flutter/material.dart';

class ChatGptMessagesListView extends StatelessWidget {
  const ChatGptMessagesListView(
      {super.key, required this.messages, required this.controller});

  final List<ChatMessage> messages;
  final ScrollController controller;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        controller: controller,
        itemCount: messages.length,
        separatorBuilder: (context, index) {
          return Container();
        },
        itemBuilder: (context, index) {
          return ChatMessageWidget(
            message: messages[index],
          );
        },
      ),
    );
  }
}

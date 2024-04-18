import 'package:chatgpt_app_openai/app/chatGPT/domin/entites/chatMessageModel.dart';
import 'package:chatgpt_app_openai/app/chatGPT/presentation/widget/ChatGptAtBubbleMessage.dart';
import 'package:chatgpt_app_openai/app/chatGPT/presentation/widget/ChatGptMeBubbleMessage.dart';
import 'package:flutter/material.dart';

class ChatMessageWidget extends StatelessWidget {
  final ChatMessage? message;

  const ChatMessageWidget({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return message!.isMe!
        ? ChatGptMeBubbleMessage(message: message)
        : ChatGptAtBubbleMessage(message: message);
  }
}

// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:chatgpt_app_openai/core/palleteColors.dart';
import 'package:flutter/material.dart';

class ChatBubbleWidget extends StatelessWidget {
  const ChatBubbleWidget({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return FadeInRight(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height * 0.03,
            vertical: MediaQuery.of(context).size.width * 0.04),
        margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.05)
            .copyWith(top: MediaQuery.of(context).size.height * 0.05),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25)
              .copyWith(topLeft: const Radius.circular(0)),
          border: Border.all(color: Pallete.borderColor),
        ),
        child: Text(
          text ?? "Good Morning, what task can I do for you?",
          style: TextStyle(
              color: Pallete.mainFontColor,
              fontSize: MediaQuery.textScaleFactorOf(context) * 19),
        ),
      ),
    );
  }
}

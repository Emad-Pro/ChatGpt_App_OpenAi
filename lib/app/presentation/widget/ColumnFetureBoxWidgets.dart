// ignore_for_file: file_names

import 'package:animate_do/animate_do.dart';
import 'package:chatgpt_app_openai/app/chatGPT/presentation/screens/chatGptOpenAi_homeBody.dart';
import 'package:chatgpt_app_openai/app/dall-E/presentation/screens/dallE_screen.dart';
import 'package:chatgpt_app_openai/core/BuildFeatureBoxWidget.dart';
import 'package:chatgpt_app_openai/core/palleteColors.dart';
import 'package:flutter/material.dart';

class ColumnFetureBoxWidgets extends StatelessWidget {
  const ColumnFetureBoxWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => ChatScreen()));
          },
          child: SlideInLeft(
            delay: const Duration(milliseconds: 200),
            child: const BuildFeatureBoxWidget(
              colorBox: Pallete.firstSuggestionBoxColor,
              headerTitle: "Chat GPT",
              descriptionText:
                  'A smarter way to stay organized and informed with ChatGPT',
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DallEScreen()));
          },
          child: SlideInLeft(
            delay: const Duration(milliseconds: 400),
            child: const BuildFeatureBoxWidget(
              colorBox: Pallete.secondSuggestionBoxColor,
              headerTitle: "Dall-E",
              descriptionText:
                  'Get inspired and stay creative with your personal assistant powered by Dall-E',
            ),
          ),
        ),
        SlideInLeft(
          delay: const Duration(milliseconds: 200 + 2 * 200),
          child: const BuildFeatureBoxWidget(
            colorBox: Pallete.thirdSuggestionBoxColor,
            headerTitle: "Smart Voice Assistant",
            descriptionText:
                'Get the best of both worlds with a boice assistant powerd',
          ),
        ),
      ],
    );
  }
}

// ignore_for_file: file_names, unused_local_variable, use_build_context_synchronously

import 'package:animate_do/animate_do.dart';
import 'package:chatgpt_app_openai/app/chatGPT/presentation/controllers/chatGptOpenAi_cubit.dart';
import 'package:chatgpt_app_openai/app/presentation/cubit/speechToText_cubit/speech_to_text_cubit.dart';
import 'package:chatgpt_app_openai/app/presentation/cubit/speechToText_cubit/speech_to_text_state.dart';

import 'package:chatgpt_app_openai/core/palleteColors.dart';
import 'package:chatgpt_app_openai/app/presentation/widget/ChatBubbleWidget.dart';
import 'package:chatgpt_app_openai/app/presentation/widget/ColumnFetureBoxWidgets.dart';
import 'package:chatgpt_app_openai/app/presentation/widget/FewFeaturesWidget.dart';
import 'package:chatgpt_app_openai/app/presentation/widget/ImageVirtualAssistantWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:iconsax/iconsax.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sofia"),
        centerTitle: true,
        leading: const Icon(Iconsax.menu),
      ),
      floatingActionButton: ZoomIn(
        child: FloatingActionButton(
          onPressed: () async {},
          backgroundColor: Pallete.firstSuggestionBoxColor,
          child: const Icon(Iconsax.microphone),
        ),
      ),
      body: BlocListener<SpeechToTextCubit, SpeechToTextState>(
        listener: (context, state) {},
        child: SingleChildScrollView(
          child: Builder(builder: (context) {
            final speechToTextState = context.watch<SpeechToTextCubit>().state;
            final speechOpenAiState = context.watch<ChatGptOpenAiCubit>().state;

            return const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageVirtualAssistantWidget(),
                ChatBubbleWidget(),
                FewFeaturesWidget(),
                ColumnFetureBoxWidgets()
              ],
            );
          }),
        ),
      ),
    );
  }
}

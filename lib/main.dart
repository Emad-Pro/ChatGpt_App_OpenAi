import 'package:chatgpt_app_openai/app/chatGPT/presentation/controllers/chatGptOpenAi_cubit.dart';
import 'package:chatgpt_app_openai/app/dall-E/presentation/controller/dall_e_cubit.dart';
import 'package:chatgpt_app_openai/app/presentation/cubit/speechToText_cubit/speech_to_text_cubit.dart';

import 'package:chatgpt_app_openai/core/BlocObserver.dart';
import 'package:chatgpt_app_openai/core/palleteColors.dart';

import 'package:chatgpt_app_openai/dio_helper.dart';
import 'package:chatgpt_app_openai/services/get_it/service_locator.dart';
import 'package:chatgpt_app_openai/services/mysetting.dart';
import 'package:chatgpt_app_openai/services/shared_preferences/CacheHelper.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  await DioHelper.init();
  ServiceLocator().init();
  MySetting().getUserData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SpeechToTextCubit()..initSpeech()),
        BlocProvider(
            create: (context) =>
                ChatGptOpenAiCubit(getIt())..getDataMessagesChat()),
        BlocProvider(create: (context) => DallECubit(getIt()))
      ],
      child: MaterialApp(
        darkTheme: ThemeData.dark(useMaterial3: true).copyWith(),
        themeMode: ThemeMode.light,
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true).copyWith(
            scaffoldBackgroundColor: Pallete.whiteColor,
            appBarTheme:
                const AppBarTheme(backgroundColor: Pallete.whiteColor)),
        home: MySetting().getUserData(),
      ),
    );
  }
}

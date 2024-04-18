import 'package:bloc/bloc.dart';
import 'package:chatgpt_app_openai/app/presentation/cubit/speechToText_cubit/speech_to_text_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextCubit extends Cubit<SpeechToTextState> {
  SpeechToTextCubit() : super(SpeechToTextState());

  SpeechToText speechToText = SpeechToText();
  bool speechEnabled = false;
  String lastWords = '';

  initSpeech() async {
    speechEnabled = await speechToText.initialize();
  }

  Future<void> startListeningSpeechToText() async {
    await speechToText.listen(onResult: onSpeechResultSpeechToText);
    emit(StartListeningSpeechToTextState());
  }

  Future<void> stopListeningSpeechToText() async {
    await speechToText.stop();
    emit(StopListeningSpeechToTextState());
  }

  onSpeechResultSpeechToText(SpeechRecognitionResult result) {
    lastWords = result.recognizedWords;
    emit(OnSpeechResultSpeechToTextState());
  }
}

import 'package:bloc/bloc.dart';
import 'package:chatgpt_app_openai/app/dall-E/data/model/dall-E_Model.dart';
import 'package:chatgpt_app_openai/app/dall-E/domin/cases/dallEOpenAiUseCases.dart';
import 'package:chatgpt_app_openai/services/enum.dart';
import 'package:equatable/equatable.dart';

part 'dall_e_state.dart';

class DallECubit extends Cubit<DallEState> {
  final BaseDallEOpenAiUseCases baseDallEOpenAiUseCases;
  DallECubit(this.baseDallEOpenAiUseCases) : super(const DallEState());
  List<String> imageLanding = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg"
  ];
  Future<void> sendMessgeAndGetData(String prompt) async {
    emit(const DallEState(dallEOpenAiState: DallRequestState.loadingState));
    final result = await baseDallEOpenAiUseCases.getDallEOpenAiUseCaces(prompt);
    result.fold(
        (l) => emit(state.copyWith(
            dallEOpenAiState: DallRequestState.erorrState,
            dallEOpenAiMessage: l.erorrMessage)),
        (r) => emit(state.copyWith(
            dallEOpenAiModel: r,
            dallEOpenAiState: DallRequestState.successState)));
  }
}

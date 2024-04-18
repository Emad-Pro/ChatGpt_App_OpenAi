part of 'dall_e_cubit.dart';

class DallEState extends Equatable {
  final DallRequestState dallEOpenAiState;
  final DallEModel? dallEOpenAiModel;
  final String dallEOpenAiMessage;

  const DallEState(
      {this.dallEOpenAiState = DallRequestState.normalState,
      this.dallEOpenAiModel,
      this.dallEOpenAiMessage = ''});
  DallEState copyWith({
    DallRequestState? dallEOpenAiState,
    DallEModel? dallEOpenAiModel,
    String? dallEOpenAiMessage,
  }) {
    return DallEState(
      dallEOpenAiState: dallEOpenAiState ?? this.dallEOpenAiState,
      dallEOpenAiModel: dallEOpenAiModel ?? this.dallEOpenAiModel,
      dallEOpenAiMessage: dallEOpenAiMessage ?? this.dallEOpenAiMessage,
    );
  }

  @override
  List<Object?> get props => [
        dallEOpenAiState,
        dallEOpenAiModel,
        dallEOpenAiMessage,
      ];
}

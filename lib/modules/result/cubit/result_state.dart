part of 'result_cubit.dart';

class ResultState extends BaseState {
  const ResultState({
    required this.choiceResult,
  });

  final ChoiceResult choiceResult;

  ResultState copyWith({
    ChoiceResult? choiceResult,
  }) {
    return ResultState(
      choiceResult: choiceResult ?? this.choiceResult,
    );
  }
}

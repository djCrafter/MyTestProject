import 'package:my_test_project/core/navigation/route_state.dart';
import 'package:my_test_project/data/repository/choice_repository.dart';
import 'package:my_test_project/domain/model/choice_result.dart';
import 'package:my_test_project/modules/common/cubit/base_cubit.dart';

part 'result_state.dart';

class ResultCubit extends BaseCubit<ResultState> {
  ResultCubit(
      this._choiceRepository,
      {
        required ChoiceResult choiceResult,
      }
      ) : super(ResultState(choiceResult: choiceResult));

  final ChoiceRepository _choiceRepository;

  Future<void> resetChoice() async {
    await _choiceRepository.clearChoiceResult();
    addRoute(ChoiceRouteState());
  }
}

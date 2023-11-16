import 'package:my_test_project/core/navigation/route_state.dart';
import 'package:my_test_project/data/repository/choice_repository.dart';
import 'package:my_test_project/modules/common/cubit/base_cubit.dart';

part 'splash_state.dart';

class SplashCubit extends BaseCubit<SplashState> {
  SplashCubit(this._choiceRepository) : super(const SplashState());

  final ChoiceRepository _choiceRepository;

  Future<void> checkIfAlreadyHaveResult() async {
    final choiceResult = await _choiceRepository.loadChoiceResult();
    if (choiceResult != null) {
      addRoute(ResultRouteState(choiceResult));
    } else {
      addRoute(ChoiceRouteState());
    }
  }
}

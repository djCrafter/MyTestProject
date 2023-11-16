import 'package:my_test_project/core/navigation/route_state.dart';
import 'package:my_test_project/domain/enum/choice.dart';
import 'package:my_test_project/modules/common/cubit/base_cubit.dart';

part 'choice_state.dart';

class ChoiceCubit extends BaseCubit<ChoiceState> {
  ChoiceCubit() : super(const ChoiceState());

  void navigateToBirthdayScreen(UserChoice choice) => addRoute(BirthdayRouteState(choice));
}

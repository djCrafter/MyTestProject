import 'package:my_test_project/core/navigation/route_state.dart';
import 'package:my_test_project/data/repository/choice_repository.dart';
import 'package:my_test_project/domain/enum/choice.dart';
import 'package:my_test_project/domain/model/choice_result.dart';
import 'package:my_test_project/modules/common/cubit/base_cubit.dart';

part 'birthday_state.dart';

class BirthdayCubit extends BaseCubit<BirthdayState> {
  BirthdayCubit(this._choiceRepository, {required this.userChoice}) : super(const BirthdayState());

  final UserChoice userChoice;

  final ChoiceRepository _choiceRepository;

  void updateBirthdayYear(int value) => emit(state.copyWith(birthdayYear: value));

  Future<void> saveAndGoToResultPage() async {
    final choiceResult = ChoiceResult(choice: userChoice, birthdayYear: state.birthdayYear);
    await _choiceRepository.saveChoiceResult(choiceResult);
    addRoute(ResultRouteState(choiceResult));
  }
}

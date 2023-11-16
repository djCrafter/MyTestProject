import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_test_project/core/di/dependency_provider.dart';
import 'package:my_test_project/core/navigation/route_manager.dart';
import 'package:my_test_project/core/navigation/route_state.dart';
import 'package:my_test_project/domain/model/choice_result.dart';
import 'package:my_test_project/modules/common/view/base_screen.dart';
import 'package:my_test_project/modules/result/cubit/result_cubit.dart';
import 'package:my_test_project/modules/result/view/result_layout.dart';

@RoutePage()
class ResultScreen extends BaseScreen<ResultState, ResultCubit, ResultLayout> {
  const ResultScreen(this._arguments, {super.key});

  final ResultScreenArguments _arguments;

  @override
  ResultCubit get cubit => ResultCubit(get(), choiceResult: _arguments.choiceResult);

  @override
  ResultLayout get layout => const ResultLayout();

  @override
  void onRoute(BuildContext context, RouteState state) {
    if (state is ChoiceRouteState) {
      context.replaceRoute(const ChoiceRoute());
    } else {
      super.onRoute(context, state);
    }
  }
}

class ResultScreenArguments {
  const ResultScreenArguments(this.choiceResult);

  final ChoiceResult choiceResult;
}

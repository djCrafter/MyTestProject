import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_test_project/core/di/dependency_provider.dart';
import 'package:my_test_project/core/navigation/route_manager.dart';
import 'package:my_test_project/core/navigation/route_state.dart';
import 'package:my_test_project/domain/enum/choice.dart';
import 'package:my_test_project/modules/birthday/cubit/birthday_cubit.dart';
import 'package:my_test_project/modules/birthday/view/birthday_layout.dart';
import 'package:my_test_project/modules/common/view/base_screen.dart';
import 'package:my_test_project/modules/result/view/result_screen.dart';

@RoutePage()
class BirthdayScreen extends BaseScreen<BirthdayState, BirthdayCubit, BirthdayLayout> {
  const BirthdayScreen(this._arguments, {super.key});

  final BirthdayScreenArguments _arguments;

  @override
  BirthdayCubit get cubit => BirthdayCubit(get(), userChoice: _arguments.value);

  @override
  BirthdayLayout get layout => const BirthdayLayout();

  @override
  void onRoute(BuildContext context, RouteState state) {
    if (state is ResultRouteState) {
      context.replaceRoute(ResultRoute(arguments: ResultScreenArguments(state.choiceResult)));
    } else {
      super.onRoute(context, state);
    }
  }
}

class BirthdayScreenArguments {
  const BirthdayScreenArguments(this.value);

  final UserChoice value;
}

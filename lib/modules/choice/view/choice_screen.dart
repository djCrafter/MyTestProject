import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_project/core/di/dependency_provider.dart';
import 'package:my_test_project/core/navigation/route_manager.dart';
import 'package:my_test_project/core/navigation/route_state.dart';
import 'package:my_test_project/modules/birthday/view/birthday_screen.dart';
import 'package:my_test_project/modules/choice/cubit/choice_cubit.dart';
import 'package:my_test_project/modules/choice/view/choice_layout.dart';
import 'package:my_test_project/modules/common/view/base_screen.dart';

@RoutePage()
class ChoiceScreen extends BaseScreen<ChoiceState, ChoiceCubit, ChoiceLayout> {
  const ChoiceScreen({super.key});

  @override
  ChoiceCubit get cubit => ChoiceCubit();

  @override
  ChoiceLayout get layout => const ChoiceLayout();

  @override
  void onRoute(BuildContext context, RouteState state) {
    if (state is BirthdayRouteState) {
      context.pushRoute(BirthdayRoute(arguments: BirthdayScreenArguments(state.value)));
    } else {
      super.onRoute(context, state);
    }
  }
}

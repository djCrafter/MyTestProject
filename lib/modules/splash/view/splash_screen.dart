import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_test_project/core/di/dependency_provider.dart';
import 'package:my_test_project/core/navigation/route_manager.dart';
import 'package:my_test_project/core/navigation/route_state.dart';
import 'package:my_test_project/modules/common/view/base_screen.dart';
import 'package:my_test_project/modules/result/view/result_screen.dart';
import 'package:my_test_project/modules/splash/cubit/splash_cubit.dart';
import 'package:my_test_project/modules/splash/view/splash_layout.dart';

@RoutePage()
class SplashScreen extends BaseScreen<SplashState, SplashCubit, SplashLayout> {
  const SplashScreen({super.key});

  @override
  SplashCubit get cubit => SplashCubit(get());

  @override
  SplashLayout get layout => const SplashLayout();

  @override
  void onRoute(BuildContext context, RouteState state) {
    if (state is ResultRouteState) {
      context.replaceRoute(ResultRoute(arguments: ResultScreenArguments(state.choiceResult)));
    } else if (state is ChoiceRouteState) {
      context.replaceRoute(const ChoiceRoute());
    } else {
      super.onRoute(context, state);
    }
  }
}

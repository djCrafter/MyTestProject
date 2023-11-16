import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:my_test_project/modules/birthday/view/birthday_screen.dart';
import 'package:my_test_project/modules/choice/view/choice_screen.dart';
import 'package:my_test_project/modules/result/view/result_screen.dart';
import 'package:my_test_project/modules/splash/view/splash_screen.dart';

part 'route_manager.gr.dart';

@AutoRouterConfig()
class RouteManager extends _$RouteManager {
  RouteManager._();

  static RouteManager instance = RouteManager._();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: ChoiceRoute.page),
        AutoRoute(page: BirthdayRoute.page),
        AutoRoute(page: ResultRoute.page),
      ];
}

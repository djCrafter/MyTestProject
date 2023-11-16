// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'route_manager.dart';

abstract class _$RouteManager extends RootStackRouter {
  // ignore: unused_element
  _$RouteManager({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BirthdayRoute.name: (routeData) {
      final args = routeData.argsAs<BirthdayRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BirthdayScreen(
          args.arguments,
          key: args.key,
        ),
      );
    },
    ChoiceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ChoiceScreen(),
      );
    },
    ResultRoute.name: (routeData) {
      final args = routeData.argsAs<ResultRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: ResultScreen(
          args.arguments,
          key: args.key,
        ),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [BirthdayScreen]
class BirthdayRoute extends PageRouteInfo<BirthdayRouteArgs> {
  BirthdayRoute({
    required BirthdayScreenArguments arguments,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          BirthdayRoute.name,
          args: BirthdayRouteArgs(
            arguments: arguments,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'BirthdayRoute';

  static const PageInfo<BirthdayRouteArgs> page =
      PageInfo<BirthdayRouteArgs>(name);
}

class BirthdayRouteArgs {
  const BirthdayRouteArgs({
    required this.arguments,
    this.key,
  });

  final BirthdayScreenArguments arguments;

  final Key? key;

  @override
  String toString() {
    return 'BirthdayRouteArgs{arguments: $arguments, key: $key}';
  }
}

/// generated route for
/// [ChoiceScreen]
class ChoiceRoute extends PageRouteInfo<void> {
  const ChoiceRoute({List<PageRouteInfo>? children})
      : super(
          ChoiceRoute.name,
          initialChildren: children,
        );

  static const String name = 'ChoiceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ResultScreen]
class ResultRoute extends PageRouteInfo<ResultRouteArgs> {
  ResultRoute({
    required ResultScreenArguments arguments,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ResultRoute.name,
          args: ResultRouteArgs(
            arguments: arguments,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ResultRoute';

  static const PageInfo<ResultRouteArgs> page = PageInfo<ResultRouteArgs>(name);
}

class ResultRouteArgs {
  const ResultRouteArgs({
    required this.arguments,
    this.key,
  });

  final ResultScreenArguments arguments;

  final Key? key;

  @override
  String toString() {
    return 'ResultRouteArgs{arguments: $arguments, key: $key}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

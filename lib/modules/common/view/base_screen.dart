import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_project/core/navigation/route_state.dart';
import 'package:my_test_project/modules/common/cubit/base_cubit.dart';
import 'package:my_test_project/modules/common/view/base_layout.dart';

abstract class BaseScreen<S extends BaseState, C extends BaseCubit<S>, L extends BaseLayout> extends StatelessWidget {
  const BaseScreen({super.key});

  @protected
  abstract final C cubit;

  @protected
  abstract final L layout;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<C>(
      create: (_) => cubit,
      child: Builder(
        builder: (context) {
          return BlocListener<RouteCubit, RouteState>(
            bloc: context.read<C>().routeCubit,
            listener: onRoute,
            child: layout,
          );
        },
      ),
    );
  }

  @protected
  @mustCallSuper
  void onRoute(BuildContext context, RouteState state) {
    if (state is BackRouteState) {
      context.popRoute();
    }
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_project/core/navigation/route_state.dart';

part 'base_state.dart';

abstract class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(super.initialState);

  final _subscriptions = <StreamSubscription<dynamic>>[];

  final routeCubit = RouteCubit();
  final progressCubit = ProgressCubit();
  late final errorCubit = ErrorCubit();

  @protected
  void execute<T>(
    Future<T> action, {
    required void Function() retry,
    void Function(T result)? onSuccess,
    void Function(ErrorState error)? onError,
    bool withProgress = true,
  }) {
    if (withProgress) showProgress();
    action.then((result) {
      onSuccess?.call(result);
    }).catchError((Object e) {
      final error = ErrorState(retry, ExecutionError(e));
      onError != null ? onError(error) : handleError(error);
    }).whenComplete(() {
      if (withProgress) hideProgress();
    });
  }

  @protected
  void subscribe<T>(
    Stream<T> stream,
    void Function() retry, {
    void Function(T event)? onData,
    void Function(ErrorState error)? onError,
  }) {
    final subscription = stream.listen(
      onData,
      onError: (Object e) {
        final error = ErrorState(retry, ExecutionError(e));
        onError != null ? onError(error) : handleError(error);
      },
    );
    _subscriptions.add(subscription);
  }

  @protected
  bool isSubscribed<T>() => _subscriptions.any((type) => type is StreamSubscription<T>);

  @protected
  Future<void> unsubscribe<T>() async {
    final subscriptions = _subscriptions.whereType<StreamSubscription<T>>();
    for (final subscription in subscriptions) {
      await subscription.cancel();
    }
    _subscriptions.removeWhere(subscriptions.contains);
  }

  @protected
  Future<void> unsubscribeAll() async {
    for (final subscription in _subscriptions) {
      await subscription.cancel();
    }
    _subscriptions.clear();
  }

  @protected
  void addRoute(RouteState state) => routeCubit.emit(state);

  @protected
  void showProgress() => progressCubit.emit(true);

  @protected
  void hideProgress() => progressCubit.emit(false);

  @protected
  bool inProgress() => progressCubit.state;

  @protected
  void handleError(ErrorState error) => errorCubit.emit(error);

  @mustCallSuper
  @override
  Future<void> close() async {
    await unsubscribeAll();
    return super.close();
  }
}

class RouteCubit extends Cubit<RouteState> {
  RouteCubit() : super(RouteState());
}

class ProgressCubit extends Cubit<bool> {
  ProgressCubit() : super(false);
}

class ErrorCubit extends Cubit<ErrorState> {
  ErrorCubit() : super(ErrorState(() {}));
}

class ErrorState {
  ErrorState(
    this.retry, [
    this.error,
  ]);

  final ExecutionError? error;
  final void Function() retry;
}

class ExecutionError {
  ExecutionError(this.cause);

  final Object? cause;

  @override
  String toString() {
    return 'ExecutionError{cause: $cause}';
  }
}

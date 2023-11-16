import 'package:flutter/material.dart';
import 'package:my_test_project/domain/enum/choice.dart';
import 'package:my_test_project/domain/model/choice_result.dart';

@immutable
class RouteState {}

class ChoiceRouteState extends RouteState {}

class BirthdayRouteState extends RouteState {
  BirthdayRouteState(this.value);

  final UserChoice value;
}

class ResultRouteState extends RouteState {
  ResultRouteState(this.choiceResult);

  final ChoiceResult choiceResult;
}

class BackRouteState<T> extends RouteState {
  BackRouteState(this.result);

  final T result;
}

class BackUntilRouteState<T extends RouteState> extends RouteState {}

class SuccessRouteState<T> extends RouteState {}

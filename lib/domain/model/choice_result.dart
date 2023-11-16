import 'package:flutter/material.dart';
import 'package:my_test_project/domain/enum/choice.dart';

@immutable
class ChoiceResult {
  const ChoiceResult({required this.choice, required this.birthdayYear});

  final UserChoice choice;
  final int birthdayYear;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ChoiceResult &&
          runtimeType == other.runtimeType &&
          choice == other.choice &&
          birthdayYear == other.birthdayYear;

  @override
  int get hashCode =>
      choice.hashCode ^
      birthdayYear.hashCode;

  ChoiceResult copyWith({
    UserChoice? choice,
    int? birthdayYear,
  }) {
    return ChoiceResult(
      choice: choice ?? this.choice,
      birthdayYear: birthdayYear ?? this.birthdayYear,
    );
  }
}

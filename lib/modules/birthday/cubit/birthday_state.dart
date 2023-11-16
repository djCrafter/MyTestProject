part of 'birthday_cubit.dart';

class BirthdayState extends BaseState {
  const BirthdayState({
    this.birthdayYear = 1995,
  });

  final int birthdayYear;

  BirthdayState copyWith({
    int? birthdayYear,
  }) {
    return BirthdayState(
      birthdayYear: birthdayYear ?? this.birthdayYear,
    );
  }
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_test_project/data/source/local/database.dart';
import 'package:my_test_project/domain/enum/choice.dart';
import 'package:my_test_project/domain/model/choice_result.dart';

part 'choice_result_entity.g.dart';

const _indexChoice = 0;
const _indexBirthdayYear = 1;

@HiveType(typeId: Database.choiceResultId)
class ChoiceResultEntity {
  ChoiceResultEntity({
    required this.choice,
    required this.birthdayYear,
  });

  ChoiceResultEntity.fromChoiceResult(ChoiceResult choiceResult) :
        this(choice: choiceResult.choice, birthdayYear: choiceResult.birthdayYear);

  @HiveField(_indexChoice)
  final UserChoice choice;
  @HiveField(_indexBirthdayYear)
  final int birthdayYear;

  ChoiceResult get toChoiceResult {
    return ChoiceResult(choice: choice, birthdayYear: birthdayYear);
  }
}

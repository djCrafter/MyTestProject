import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_test_project/data/model/local/choice_result_entity.dart';

class Database {
  static const choiceResultId = 0;
  static const userChoiceEnumId = 1;

  static const _boxNameChoiceResult = 'choice_result_box';

  static const _keyChoiceResult = 'choice_result_key';

  static final _boxChoiceResult = Hive.openBox<ChoiceResultEntity>(_boxNameChoiceResult);

  Future<void> saveChoiceResult(ChoiceResultEntity choiceResultEntity) async => (await _boxChoiceResult).put(_keyChoiceResult, choiceResultEntity);

  Future<ChoiceResultEntity?> loadChoiceResult() async => (await _boxChoiceResult).get(_keyChoiceResult);

  Future<void> clearChoiceResult() async => (await _boxChoiceResult).clear();
}

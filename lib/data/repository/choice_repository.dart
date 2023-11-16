import 'package:my_test_project/data/model/local/choice_result_entity.dart';
import 'package:my_test_project/data/source/local/database.dart';
import 'package:my_test_project/domain/model/choice_result.dart';

class ChoiceRepository {
  ChoiceRepository(
      this._database,
      );

  final Database _database;

  Future<ChoiceResult?> loadChoiceResult() async {
    final choiceResultEntity = await _database.loadChoiceResult();
    return choiceResultEntity?.toChoiceResult;
  }

  Future<void> saveChoiceResult(ChoiceResult choiceResult) =>
      _database.saveChoiceResult(ChoiceResultEntity.fromChoiceResult(choiceResult));

  Future<void> clearChoiceResult() => _database.clearChoiceResult();
}

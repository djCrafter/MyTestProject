import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_test_project/data/model/local/choice_result_entity.dart';
import 'package:my_test_project/data/source/local/database.dart';
import 'package:my_test_project/domain/enum/choice.dart';
import 'package:path_provider/path_provider.dart';

Future<Database> initDatabase() async {
  Hive
    ..init((await getApplicationDocumentsDirectory()).path)
    ..registerAdapter(ChoiceResultEntityAdapter())
    ..registerAdapter(UserChoiceAdapter());
  return Database();
}

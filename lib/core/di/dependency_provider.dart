import 'package:get_it/get_it.dart';
import 'package:my_test_project/core/di/component/database_component.dart';
import 'package:my_test_project/data/repository/choice_repository.dart';

T get<T extends Object>() => GetIt.I<T>();

Future<void> setupDI() async {
  GetIt.I
    ..registerSingleton(await initDatabase())
    ..registerFactory(() => ChoiceRepository(get()));
}

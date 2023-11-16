import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:my_test_project/core/extension/build_context_extension.dart';
import 'package:my_test_project/data/source/local/database.dart';

part 'choice.g.dart';

@HiveType(typeId: Database.userChoiceEnumId)
enum UserChoice {
  @HiveField(0)
  trackPeriod,
  @HiveField(1)
  getPregnant;

  String translate(BuildContext context) {
    final string = context.strings;
    switch (this) {
      case UserChoice.trackPeriod:
        return string.trackMyPeriod;
      case UserChoice.getPregnant:
        return string.getPregnant;
    }
  }
}

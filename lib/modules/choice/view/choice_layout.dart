import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_project/core/extension/build_context_extension.dart';
import 'package:my_test_project/domain/enum/choice.dart';
import 'package:my_test_project/modules/choice/cubit/choice_cubit.dart';
import 'package:my_test_project/modules/choice/view/component/choice_button.dart';
import 'package:my_test_project/modules/common/view/base_layout.dart';
import 'package:my_test_project/resources/gen/assets.gen.dart';

class ChoiceLayout extends BaseLayout {
  const ChoiceLayout({super.key});

  @override
  State<StatefulWidget> createState() => _ChoiceLayoutState();
}

class _ChoiceLayoutState extends BaseLayoutState<ChoiceState, ChoiceCubit, ChoiceLayout> {

  @override
  AssetGenImage? get backgroundImage => Assets.images.background1;

  @override
  Widget buildLayout(BuildContext context) {
    final strings = context.strings;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: BlocBuilder<ChoiceCubit, ChoiceState>(
        builder: (_, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ChoiceButton(
                    userChoice: UserChoice.trackPeriod,
                    description: strings.contraceptionAndWellbeing,
                    icon: Assets.images.arrowForward,
                    onTap: cubit.navigateToBirthdayScreen,
                ),
                const SizedBox(height: 80),
                ChoiceButton(
                  userChoice: UserChoice.getPregnant,
                  description: strings.learnAboutReproductiveHealth,
                  icon: Assets.images.arrowForward,
                  onTap: cubit.navigateToBirthdayScreen,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

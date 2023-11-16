import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_project/core/extension/build_context_extension.dart';
import 'package:my_test_project/modules/common/view/base_layout.dart';
import 'package:my_test_project/modules/common/view/widgets/primary_button.dart';
import 'package:my_test_project/modules/result/cubit/result_cubit.dart';
import 'package:my_test_project/modules/result/view/component/result_item.dart';
import 'package:my_test_project/resources/gen/assets.gen.dart';

class ResultLayout extends BaseLayout {
  const ResultLayout({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _ResultLayoutState();
}

class _ResultLayoutState extends BaseLayoutState<ResultState, ResultCubit, ResultLayout> {

  @override
  AssetGenImage? get backgroundImage => Assets.images.background3;

  @override
  Widget buildLayout(BuildContext context) {
    final strings = context.strings;
    return BlocBuilder<ResultCubit, ResultState>(
      builder: (_, state) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ResultItem(title: strings.selectedOnFirstPage, result: state.choiceResult.choice.translate(context)),
                const SizedBox(height: 50),
                ResultItem(title: strings.selectedOnSecondPage, result: state.choiceResult.birthdayYear.toString()),
                const SizedBox(height: 50),
                PrimaryButton(
                  width: MediaQuery.of(context).size.width / 2,
                  icon: Assets.images.reset,
                  onTap: cubit.resetChoice,
                  title: strings.reset,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

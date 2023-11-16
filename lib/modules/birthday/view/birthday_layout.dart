import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_project/core/extension/build_context_extension.dart';
import 'package:my_test_project/modules/birthday/cubit/birthday_cubit.dart';
import 'package:my_test_project/modules/common/view/base_layout.dart';
import 'package:my_test_project/modules/common/view/widgets/number_picker.dart';
import 'package:my_test_project/modules/common/view/widgets/primary_button.dart';
import 'package:my_test_project/resources/gen/assets.gen.dart';
import 'package:my_test_project/resources/gen/colors.gen.dart';
import 'package:my_test_project/resources/styles.dart';

class BirthdayLayout extends BaseLayout {
  const BirthdayLayout({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _BirthdayLayoutState();
}

class _BirthdayLayoutState extends BaseLayoutState<BirthdayState, BirthdayCubit, BirthdayLayout> {

  @override
  AssetGenImage? get backgroundImage => Assets.images.background2;

  @override
  Widget buildLayout(BuildContext context) {
    final strings = context.strings;
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
              Text(
                strings.logInYourDateOfBirth,
                style: Styles.s22BlackW700,
              ),
            const SizedBox(height: 60),
            BlocBuilder<BirthdayCubit, BirthdayState>(
              builder: (_, state) {
                return NumberPicker(
                  decoration: BoxDecoration(
                    color: ColorName.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  selectedTextStyle: Styles.s40BlackW700,
                  textStyle: Styles.s32lightGrayW700,
                  itemWidth: MediaQuery.of(context).size.width - 60,
                  itemCount: 5,
                  value: state.birthdayYear,
                  minValue: 1960,
                  maxValue: DateTime.now().year - 14,
                  onChanged: cubit.updateBirthdayYear,
                );
              },
            ),
            const Spacer(),
            PrimaryButton(
              width: MediaQuery.of(context).size.width / 2,
              icon: Assets.images.arrowForward,
              title: strings.next,
              onTap: cubit.saveAndGoToResultPage,
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}

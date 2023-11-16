import 'package:flutter/material.dart';
import 'package:my_test_project/core/extension/color_extension.dart';
import 'package:my_test_project/domain/enum/choice.dart';
import 'package:my_test_project/resources/gen/assets.gen.dart';
import 'package:my_test_project/resources/gen/colors.gen.dart';
import 'package:my_test_project/resources/styles.dart';

class ChoiceButton extends StatelessWidget {
  const ChoiceButton({
    required this.icon,
    required this.description,
    required this.onTap,
    required this.userChoice,
    super.key,
  });

  final SvgGenImage icon;
  final String description;
  final UserChoice userChoice;
  final void Function(UserChoice) onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(userChoice),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: ColorName.lightPink,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userChoice.translate(context),
                  style: Styles.s24BlackW700,
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: Styles.s16BlackW400,
                ),
              ],
            ),
            CircleAvatar(
              radius: 16,
              backgroundColor: ColorName.darkBlue,
              child: icon.svg(
                height: 18,
                width: 18,
                colorFilter: ColorName.lightPink.toSvgColorFilter,
                fit: BoxFit.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

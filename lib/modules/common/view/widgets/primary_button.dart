import 'package:flutter/material.dart';
import 'package:my_test_project/core/extension/color_extension.dart';
import 'package:my_test_project/resources/gen/assets.gen.dart';
import 'package:my_test_project/resources/gen/colors.gen.dart';
import 'package:my_test_project/resources/styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    required this.icon,
    required this.onTap,
    required this.title,
    this.width,
    super.key,
  });

  final SvgGenImage icon;
  final String title;
  final VoidCallback onTap;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: ColorName.darkBlue,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           const CircleAvatar(
             radius: 16,
             backgroundColor: Colors.transparent,
           ),
            Text(
              title,
              style: Styles.s18WhiteW400,
            ),
            CircleAvatar(
              radius: 16,
              backgroundColor: ColorName.white,
              child: icon.svg(
                height: 18,
                width: 18,
                colorFilter: ColorName.darkBlue.toSvgColorFilter,
                fit: BoxFit.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

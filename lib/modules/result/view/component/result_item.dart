import 'package:flutter/cupertino.dart';
import 'package:my_test_project/resources/gen/colors.gen.dart';
import 'package:my_test_project/resources/styles.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({
    required this.title,
    required this.result,
    super.key,
  });

  final String title;
  final String result;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorName.lightPink,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            title,
            style: Styles.s24BlackW700,
          ),
          const SizedBox(height: 8),
          Text(
            result,
            style: Styles.s16BlackW400,
          ),
        ],
      ),
    );
  }
}
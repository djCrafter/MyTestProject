import 'package:flutter/material.dart';
import 'package:my_test_project/resources/gen/colors.gen.dart';

class ModalProgressIndicator extends StatelessWidget {
  const ModalProgressIndicator({
    required this.progress,
    this.indicator = const CircularProgressIndicator(
      color: ColorName.white,
    ),
    this.backgroundColor = ColorName.black,
    this.backgroundOpacity = _defaultOpacity,
    super.key,
  });

  static const _defaultOpacity = 0.5;

  final bool progress;
  final Widget indicator;
  final Color backgroundColor;
  final double backgroundOpacity;

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    if (progress) {
      final modal = [
        Opacity(
          opacity: backgroundOpacity,
          child: ModalBarrier(
            dismissible: false,
            color: backgroundColor,
          ),
        ),
        Center(child: indicator),
      ];
      widgets.addAll(modal);
    }
    return Stack(children: widgets);
  }
}

import 'package:flutter/material.dart';
import 'package:my_test_project/modules/common/view/base_layout.dart';
import 'package:my_test_project/modules/common/view/widgets/modal_progress_indicator.dart';
import 'package:my_test_project/modules/splash/cubit/splash_cubit.dart';

class SplashLayout extends BaseLayout {
  const SplashLayout({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _SplashLayoutState();
}

class _SplashLayoutState extends BaseLayoutState<SplashState, SplashCubit, SplashLayout> {
  @override
  void onInit() => cubit.checkIfAlreadyHaveResult();

  @override
  Widget buildLayout(BuildContext context) {
    return const Center(
      child: ModalProgressIndicator(progress: true),
    );
  }
}

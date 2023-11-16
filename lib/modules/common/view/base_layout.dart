import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_test_project/core/extension/build_context_extension.dart';
import 'package:my_test_project/modules/common/cubit/base_cubit.dart';
import 'package:my_test_project/modules/common/view/widgets/modal_progress_indicator.dart';
import 'package:my_test_project/resources/gen/assets.gen.dart';

abstract class BaseLayout extends StatefulWidget {
  const BaseLayout({super.key});
}

abstract class BaseLayoutState<S extends BaseState, C extends BaseCubit<S>, L extends BaseLayout> extends State<L> {
  @protected
  late final C cubit;

  @protected
  bool inSafeArea = false;

  @protected
  Color? backgroundColor;

  @protected
  AssetGenImage? backgroundImage;

  @override
  void initState() {
    super.initState();
    cubit = context.read<C>();
    WidgetsBinding.instance.addPostFrameCallback((_) => onInit());
  }

  @protected
  void onInit() {}

  @override
  Widget build(BuildContext context) {
    return BlocListener<ErrorCubit, ErrorState>(
      bloc: cubit.errorCubit,
      listener: (_, state) {
        if (state.error != null) {
          handleError(state.error!, state.retry);
        }
      },
      child: BlocBuilder<ProgressCubit, bool>(
        bloc: cubit.progressCubit,
        builder: (_, inProgress) => Stack(
          children: [
            WillPopScope(
              onWillPop: inProgress ? () async => false : null,
              child: GestureDetector(
                onTap: () => context.clearFocus(),
                child: Scaffold(
                  appBar: buildAppBar(context),
                  backgroundColor: backgroundColor,
                  body: Container(
                    decoration: backgroundImage != null ? BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(backgroundImage!.keyName),
                        fit: BoxFit.cover,
                      ),
                    ) : null,
                      child: inSafeArea ? SafeArea(child: buildLayout(context)) : buildLayout(context),
                  ),
                ),
              ),
            ),
            ModalProgressIndicator(
              progress: inProgress,
            ),
          ],
        ),
      ),
    );
  }

  @protected
  PreferredSizeWidget? buildAppBar(BuildContext context) => null;

  @protected
  Widget buildLayout(BuildContext context);

  @protected
  void handleError(ExecutionError error, void Function() retry) {
    ///TO DO: error handling
  }
}

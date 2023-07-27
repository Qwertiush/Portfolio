import 'package:cv/ui/views/unity/unity_view.desktop.dart';
import 'package:cv/ui/views/unity/unity_view.mobile.dart';
import 'package:cv/ui/views/unity/unity_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class UnityView extends StackedView<UnityViewModel> {
  const UnityView({super.key});

  @override
  Widget builder(
    BuildContext context,
    UnityViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const UnityViewMobile(),
      tablet: (_) => const UnityViewMobile(),
      desktop: (_) => const UnityViewDesktop(),
    );
  }

  @override
  UnityViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      UnityViewModel();
}

import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'other_view.desktop.dart';
import 'other_view.mobile.dart';
import 'other_viewmodel.dart';

class OtherView extends StackedView<OtherViewModel> {
  const OtherView({super.key});

  @override
  Widget builder(
    BuildContext context,
    OtherViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const OtherViewMobile(),
      tablet: (_) => const OtherViewMobile(),
      desktop: (_) => const OtherViewDesktop(),
    );
  }

  @override
  OtherViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      OtherViewModel();
}

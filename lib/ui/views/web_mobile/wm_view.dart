import 'package:cv/ui/views/web_mobile/wm_view.desktop.dart';
import 'package:cv/ui/views/web_mobile/wm_view.mobile.dart';
import 'package:cv/ui/views/web_mobile/wm_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class WMView extends StackedView<WMViewModel> {
  const WMView({super.key});

  @override
  Widget builder(
    BuildContext context,
    WMViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const WMViewMobile(),
      tablet: (_) => const WMViewDesktop(),
      desktop: (_) => const WMViewDesktop(),
    );
  }

  @override
  WMViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WMViewModel();
}

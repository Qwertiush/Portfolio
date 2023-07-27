import 'package:cv/ui/views/about/about_view.desktop.dart';
import 'package:cv/ui/views/about/wm_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import 'about_view.mobile.dart';

class AboutView extends StackedView<AboutViewModel> {
  const AboutView({super.key});

  @override
  Widget builder(
    BuildContext context,
    AboutViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const AboutViewMobile(),
      tablet: (_) => const AboutViewDesktop(),
      desktop: (_) => const AboutViewDesktop(),
    );
  }

  @override
  AboutViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      AboutViewModel();
}

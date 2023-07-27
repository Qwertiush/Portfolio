import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';
import 'contact_view.desktop.dart';
import 'contact_view.mobile.dart';
import 'contact_viewmodel.dart';

class ContactView extends StackedView<ContactViewModel> {
  const ContactView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ContactViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const ContactViewMobile(),
      tablet: (_) => const ContactViewDesktop(),
      desktop: (_) => const ContactViewDesktop(),
    );
  }

  @override
  ContactViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ContactViewModel();
}

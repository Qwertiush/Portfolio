import 'package:cv/ui/views/projects/projects_view.desktop.dart';
import 'package:cv/ui/views/projects/projects_view.mobile.dart';
import 'package:cv/ui/views/projects/projects_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

class ProjectsView extends StackedView<ProjectsViewModel> {
  const ProjectsView({super.key});

  @override
  Widget builder(
    BuildContext context,
    ProjectsViewModel viewModel,
    Widget? child,
  ) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const ProjectsViewMobile(),
      tablet: (_) => const ProjectsViewDesktop(),
      desktop: (_) => const ProjectsViewDesktop(),
    );
  }

  @override
  ProjectsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProjectsViewModel();
}

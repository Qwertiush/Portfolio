import 'package:cv/ui/common/app_colors.dart';
import 'package:cv/ui/common/ui_helpers.dart';
import 'package:cv/ui/views/contact/contact_view.dart';
import 'package:cv/ui/views/functions/functions.dart';
import 'package:cv/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../about/about_view.dart';
import '../projects/projects_view.dart';
import 'home_viewmodel.dart';

class HomeViewDesktop extends ViewModelWidget<HomeViewModel> {
  const HomeViewDesktop({super.key});

@override
Widget build(BuildContext context, HomeViewModel viewModel) {
  return Scaffold(
    backgroundColor: kcBackgroundColor,
    body: LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double maxHeight = constraints.maxHeight;

        return SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Container(
                  constraints: BoxConstraints(
                    maxHeight: maxHeight * 0.98, // Adjust the scaling factor as needed
                    maxWidth: maxWidth * 0.98, // Adjust the scaling factor as needed
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Paweł Rycerz",
                          style: TextStyle(
                            color: kcWhite,
                            fontSize: getResponsiveMassiveFontSize(context),
                          ),
                        ),
                      ),
                      verticalSpaceLarge,
                      Row(
                        children: [
                          CustomBoxButtonWidgetLarge(
                            color1:kcBlueDark,
                             color2: kcBlueLight,
                              text: "Projects",
                              scalingFactorWidth: 0.49,
                              scalingFactorHeight: 0.49,
                              roundedBottomLeft: true,
                              roundedBottomRight: false,
                              roundedTopLeft: true,
                              roundedTopRight: false,
                              onTap: () {
                                MyFunctions.NavigateTo(context, ProjectsView());
                              },
                          ),
                          Column(
                            children: [
                              CustomBoxButtonWidgetLarge(color1: kcBlueLight,color2: kcGreenDark, text: "About me", scalingFactorWidth: 0.49, scalingFactorHeight: 0.245,roundedBottomLeft: false,roundedBottomRight: false,roundedTopLeft: false,roundedTopRight: true, onTap: () {MyFunctions.NavigateTo(context, AboutView());},),
                              CustomBoxButtonWidgetLarge(color1: kcBlueLight,color2: kcYellowDark, text: "Contact", scalingFactorWidth: 0.49, scalingFactorHeight: 0.245,roundedBottomLeft: false,roundedBottomRight: true,roundedTopLeft: false,roundedTopRight: false, onTap: () {MyFunctions.NavigateTo(context, ContactView());}),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
  }
}

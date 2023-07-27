import 'package:cv/ui/common/app_colors.dart';
import 'package:cv/ui/common/ui_helpers.dart';
import 'package:cv/ui/views/functions/functions.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/widgets.dart';
import '../about/about_view.dart';
import '../contact/contact_view.dart';
import '../projects/projects_view.dart';
import 'home_viewmodel.dart';

class HomeViewMobile extends ViewModelWidget<HomeViewModel> {
  const HomeViewMobile({super.key});

@override
Widget build(BuildContext context, HomeViewModel viewModel) {
  return Scaffold(
    backgroundColor: kcBackgroundColor,
    body: LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double maxHeight = constraints.maxHeight;

        return SingleChildScrollView(
          child: Center(
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
                  Column(
                  children: [
                    CustomBoxButtonWidgetLarge(
                        color1:kcBlueDark,
                         color2: kcBlueLight,
                          text: "Projects",
                          scalingFactorWidth: 0.9,
                          scalingFactorHeight: 0.15,
                          roundedBottomLeft: false,
                          roundedBottomRight: false,
                          roundedTopLeft: true,
                          roundedTopRight: true,
                          onTap: () {
                            MyFunctions.NavigateTo(context, ProjectsView());
                          },
                      ),
                    CustomBoxButtonWidgetLarge(color1: kcGreenLight,color2: kcGreenDark, text: "About me", scalingFactorWidth: 0.9, scalingFactorHeight: 0.15,roundedBottomLeft: false,roundedBottomRight: false,roundedTopLeft: false,roundedTopRight: false, onTap: () {MyFunctions.NavigateTo(context, AboutView());},),
                    CustomBoxButtonWidgetLarge(color1: kcYellowLight,color2: kcYellowDark, text: "Contact", scalingFactorWidth: 0.9, scalingFactorHeight: 0.15,roundedBottomLeft: true,roundedBottomRight: true,roundedTopLeft: false,roundedTopRight: false, onTap: () {MyFunctions.NavigateTo(context, ContactView());}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
  }
}

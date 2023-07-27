import 'package:cv/ui/common/app_colors.dart';
import 'package:cv/ui/common/ui_helpers.dart';
import 'package:cv/ui/views/projects/projects_viewmodel.dart';
import 'package:cv/ui/widgets/nav_bar_top_single.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/widgets.dart';
import '../functions/functions.dart';
import '../other/other_view.dart';
import '../unity/unity_view.dart';
import '../web_mobile/wm_view.dart';

class ProjectsViewMobile extends ViewModelWidget<ProjectsViewModel> {
  const ProjectsViewMobile({super.key});

@override
Widget build(BuildContext context, ProjectsViewModel viewModel) {
  return Scaffold(
    backgroundColor: kcBackgroundColor,
    body: LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double maxHeight = constraints.maxHeight;

        return Stack(
          children: [ SingleChildScrollView(
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
                        "Projects",
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
                        text: "Unity",scalingFactorWidth: 0.9,
                        scalingFactorHeight: 0.15,
                        roundedBottomLeft: false,
                        roundedBottomRight: false,
                        roundedTopLeft: true,
                        roundedTopRight: true,
                        onTap: () {
                            print("unity");
                            MyFunctions.NavigateTo(context, UnityView());
                        }
                      ),
                      CustomBoxButtonWidgetLarge(color1: kcGreenLight,color2: kcGreenDark, text: "Web Apps and Mobile Apps", scalingFactorWidth: 0.9, scalingFactorHeight: 0.15,roundedBottomLeft: false,roundedBottomRight: false,roundedTopLeft: false,roundedTopRight: false, onTap: () { MyFunctions.NavigateTo(context, WMView());},),
                      CustomBoxButtonWidgetLarge(color1: kcYellowLight,color2: kcYellowDark, text: "Other Projects", scalingFactorWidth: 0.9, scalingFactorHeight: 0.15,roundedBottomLeft: true,roundedBottomRight: true,roundedTopLeft: false,roundedTopRight: false, onTap: () {MyFunctions.NavigateTo(context, OtherView());}),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(child: NavBarTopSingle())
          ]
        );
      },
    ),
  );
  }
}
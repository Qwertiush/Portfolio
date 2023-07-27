import 'package:cv/ui/common/app_colors.dart';
import 'package:cv/ui/common/ui_helpers.dart';
import 'package:cv/ui/views/projects/projects_viewmodel.dart';
import 'package:cv/ui/views/unity/unity_view.dart';
import 'package:cv/ui/views/web_mobile/wm_view.dart';
import 'package:cv/ui/widgets/nav_bar_top_single.dart';
import 'package:cv/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../functions/functions.dart';
import '../other/other_view.dart';

class ProjectsViewDesktop extends ViewModelWidget<ProjectsViewModel> {
  const ProjectsViewDesktop({super.key});

@override
Widget build(BuildContext context, ProjectsViewModel viewModel) {
  return Scaffold(
    backgroundColor: kcBackgroundColor,
    body: LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double maxHeight = constraints.maxHeight;

        return Stack(
          children:[ 
            SingleChildScrollView(
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
                            "Projects",
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
                              text: "Unity",
                              scalingFactorWidth: 0.49,
                              scalingFactorHeight: 0.49,
                              roundedBottomLeft: true,
                              roundedBottomRight: false,
                              roundedTopLeft: true,
                              roundedTopRight: false,
                              onTap: () {
                                print("unity");
                                MyFunctions.NavigateTo(context, UnityView());
                              }
                            ),
                            Column(
                              children: [
                                CustomBoxButtonWidgetLarge(color1: kcBlueLight,color2: kcGreenDark, text: "Web Apps and Mobile Apps", scalingFactorWidth: 0.49, scalingFactorHeight: 0.245,roundedBottomLeft: false,roundedBottomRight: false,roundedTopLeft: false,roundedTopRight: true, onTap: () { MyFunctions.NavigateTo(context, WMView());},),
                                CustomBoxButtonWidgetLarge(color1: kcBlueLight,color2: kcYellowDark, text: "Other Projects", scalingFactorWidth: 0.49, scalingFactorHeight: 0.245,roundedBottomLeft: false,roundedBottomRight: true,roundedTopLeft: false,roundedTopRight: false, onTap: () {MyFunctions.NavigateTo(context, OtherView());}),
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
          ),
          Positioned(
            child: NavBarTopSingle(),
            )
          ],
        );
      },
    ),
  );
  }
}
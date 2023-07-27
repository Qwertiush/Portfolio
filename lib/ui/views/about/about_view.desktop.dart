import 'package:cv/ui/common/app_colors.dart';
import 'package:cv/ui/common/ui_helpers.dart';
import 'package:cv/ui/views/about/wm_viewmodel.dart';
import 'package:cv/ui/widgets/nav_bar_top_single.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AboutViewDesktop extends ViewModelWidget<AboutViewModel> {
  const AboutViewDesktop({super.key});

@override
Widget build(BuildContext context, AboutViewModel viewModel) {
  return Scaffold(
    backgroundColor: kcBackgroundColor,
    body: LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;

              return Stack(
                children: [ SingleChildScrollView(
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          constraints: BoxConstraints(
                          maxWidth: maxWidth * 0.6, // Adjust the scaling factor as needed
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        verticalSpaceMassive,
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "About",
                            style: TextStyle(
                              color: kcWhite,
                              fontSize: getResponsiveMassiveFontSize(context),
                            ),
                          ),
                        ),
                        verticalSpaceLarge,
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Education",
                            style: TextStyle(
                              color: kcWhite,
                              fontSize: getResponsiveLargeFontSize(context),
                            ),
                          ),
                        ),
                        verticalSpaceMedium,
                        Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Wrocław University of Science and Technology - Faculty of  Electronics - Field of study - Computer Science",
                                  style: TextStyle(
                                    color: kcWhite,
                                    fontSize: getResponsiveMediumFontSize(context),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container()
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "2019 - now",
                                  style: TextStyle(
                                    color: kcWhite,
                                    fontSize: getResponsiveMediumFontSize(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 7,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Tadeusz Kościuszko Named General High School in Krasnik",
                                  style: TextStyle(
                                    color: kcWhite,
                                    fontSize: getResponsiveMediumFontSize(context),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container()
                            ),
                            Expanded(
                              flex: 2,
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Text(
                                  "2017 - 2019",
                                  style: TextStyle(
                                    color: kcWhite,
                                    fontSize: getResponsiveMediumFontSize(context),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        verticalSpaceLarge,
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Hobby",
                            style: TextStyle(
                              color: kcWhite,
                              fontSize: getResponsiveLargeFontSize(context),
                            ),
                          ),
                        ),
                        verticalSpaceMedium,
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "I am interested in new technologies, creating mobile applications, and websites. As a hobby, I develop games using the Unity engine and I am also learning to use Unreal Engine 5.",
                            style: TextStyle(
                              color: kcWhite,
                              fontSize: getResponsiveMediumFontSize(context),
                            ),
                          ),
                        ),
                      ],
                            ),
                          ),
                        ),
                    ],
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
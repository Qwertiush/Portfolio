import 'package:cv/ui/common/app_colors.dart';
import 'package:cv/ui/common/ui_helpers.dart';
import 'package:cv/ui/views/about/wm_viewmodel.dart';
import 'package:cv/ui/widgets/nav_bar_top_single.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AboutViewMobile extends ViewModelWidget<AboutViewModel> {
  const AboutViewMobile({super.key});

@override
Widget build(BuildContext context, AboutViewModel viewModel) {
  return Scaffold(
    backgroundColor: kcBackgroundColor,
    body: LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;
        double maxHeight = constraints.maxHeight;

              return Stack(
                children: [ SingleChildScrollView(
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
                            "About",
                            style: TextStyle(
                              color: kcWhite,
                              fontSize: getResponsiveMassiveFontSize(context),
                            ),
                          ),
                        ),
                        verticalSpaceLarge,
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
import 'package:cv/ui/common/app_colors.dart';
import 'package:cv/ui/common/ui_helpers.dart';
import 'package:cv/ui/views/unity/unity_viewmodel.dart';
import 'package:cv/ui/widgets/nav_bar_top_double.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../widgets/projects_popup.dart';

class UnityViewMobile extends ViewModelWidget<UnityViewModel> {
  const UnityViewMobile({super.key});

@override
Widget build(BuildContext context, UnityViewModel viewModel) {
  return Scaffold(
    backgroundColor: kcBackgroundColor,
    body: LayoutBuilder(
      builder: (context, constraints) {
        double maxWidth = constraints.maxWidth;

        return Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: maxWidth * 0.98, // Adjust the scaling factor as needed
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          verticalSpaceMassive,
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Unity Projects",
                              style: TextStyle(
                                color: kcWhite,
                                fontSize: getResponsiveMassiveFontSize(context),
                              ),
                            ),
                          ),
                          verticalSpaceLarge,
                          FutureBuilder(
                            future: viewModel.InitializeProjectTiles(true),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator(); // Display a loading indicator while initializing project tiles
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: viewModel.projectTiles.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                      padding: EdgeInsets.symmetric(vertical: getResponsiveLargeFontSize(context)),
                                      child: viewModel.projectTiles[index],
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(child: NavBarTopDouble()),
            if (viewModel.isPoppedOut)
              ProjectsPopUp(title: viewModel.title, tiles: viewModel.tiles, scalingFactorHeight: 1, scalingFactorWidth: 1, onClose: viewModel.hidePoppedOutWidget),
          ],
        );
      },
    ),
  );
  }
}
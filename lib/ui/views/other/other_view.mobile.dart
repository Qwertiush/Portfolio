import 'package:cv/ui/common/app_colors.dart';
import 'package:cv/ui/common/ui_helpers.dart';
import 'package:cv/ui/widgets/nav_bar_top_double.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/projects_popup.dart';
import 'other_viewmodel.dart';

class OtherViewMobile extends ViewModelWidget<OtherViewModel> {
  const OtherViewMobile({super.key});

@override
Widget build(BuildContext context, OtherViewModel viewModel) {
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
                              "Other Projects",
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
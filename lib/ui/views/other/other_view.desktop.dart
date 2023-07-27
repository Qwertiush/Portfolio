import 'package:cv/ui/common/app_colors.dart';
import 'package:cv/ui/common/ui_helpers.dart';
import 'package:cv/ui/widgets/nav_bar_top_double.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../widgets/projects_popup.dart';
import 'other_viewmodel.dart';

class OtherViewDesktop extends StatelessWidget {
  const OtherViewDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtherViewModel>.reactive(
      viewModelBuilder: () => OtherViewModel(),
      onModelReady: (model) => model.InitializeProjectTiles(false),
      builder: (context, viewModel, _) {
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
                              maxWidth: maxWidth * 0.98,
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
                                if (viewModel.isLoading)
                                  CircularProgressIndicator()
                                else if (viewModel.hasError)
                                  Text('Error: ${viewModel.error}')
                                else
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: viewModel.projectTiles.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(vertical: getResponsiveLargeFontSize(context)),
                                        child: viewModel.projectTiles[index],
                                      );
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
      },
    );
  }
}
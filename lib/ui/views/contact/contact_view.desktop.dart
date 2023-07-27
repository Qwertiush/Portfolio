import 'package:cv/ui/common/app_colors.dart';
import 'package:cv/ui/common/ui_helpers.dart';
import 'package:cv/ui/widgets/nav_bar_top_single.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'contact_viewmodel.dart';

class ContactViewDesktop extends ViewModelWidget<ContactViewModel> {
  const ContactViewDesktop({super.key});

@override
Widget build(BuildContext context, ContactViewModel viewModel) {
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
                          maxWidth: maxWidth * 0.98, // Adjust the scaling factor as needed
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        verticalSpaceMassive,
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Contact",
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
                            "Email Adress",
                            style: TextStyle(
                              color: kcWhite,
                              fontSize: getResponsiveLargeFontSize(context),
                            ),
                          ),
                        ),
                        verticalSpaceMedium,
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            "pawel.rycerzk01@gmail.com",
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
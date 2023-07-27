import 'package:cv/ui/common/app_colors.dart';
import 'package:cv/ui/common/ui_helpers.dart';
import 'package:cv/ui/widgets/nav_bar_top_single.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'contact_viewmodel.dart';

class ContactViewMobile extends ViewModelWidget<ContactViewModel> {
  const ContactViewMobile({super.key});

@override
Widget build(BuildContext context, ContactViewModel viewModel) {
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
                        verticalSpaceLarge,
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
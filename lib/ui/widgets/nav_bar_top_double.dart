import 'package:cv/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../views/functions/functions.dart';
import '../views/home/home_view.dart';
import '../views/projects/projects_view.dart';

class NavBarTopDouble extends StatefulWidget {
  const NavBarTopDouble({super.key});

  @override
  State<NavBarTopDouble> createState() => _NavBarTopDoubleState();
}

class _NavBarTopDoubleState extends State<NavBarTopDouble>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Align the row contents to the center
                      children: [
                      CustomBoxButtonWidgetLarge(
                          color1: kcBlueDark,
                          color2: kcBlueLight,
                          text: "Home",
                          scalingFactorWidth: 0.49,
                          scalingFactorHeight: 0.1,
                          roundedBottomLeft: true,
                          roundedBottomRight: false,
                          roundedTopLeft: false,
                          roundedTopRight: false,
                          onTap: () {
                            MyFunctions.NavigateTo(context, HomeView());
                        },
                      ),
                      CustomBoxButtonWidgetLarge(
                        color1: kcBlueLight,
                        color2: kcBlueDark,
                        text: "Projects",
                        scalingFactorWidth: 0.49,
                        scalingFactorHeight: 0.1,
                        roundedBottomLeft: false,
                        roundedBottomRight: true,
                        roundedTopLeft: false,
                        roundedTopRight: false,
                        onTap: () {
                        MyFunctions.NavigateTo(context, ProjectsView());
                        },
                      ),
                    ],
                  );
  }
}
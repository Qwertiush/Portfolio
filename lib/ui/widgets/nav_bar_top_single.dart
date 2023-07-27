import 'package:cv/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../views/functions/functions.dart';
import '../views/home/home_view.dart';

class NavBarTopSingle extends StatefulWidget {
  const NavBarTopSingle({super.key});

  @override
  State<NavBarTopSingle> createState() => _NavBarTopSingleState();
}

class _NavBarTopSingleState extends State<NavBarTopSingle>
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
    return Align(
              alignment: Alignment.topCenter,
              child: CustomBoxButtonWidgetLarge(
                  color1:kcBlueDark,
                  color2: kcBlueLight,
                  text: "Home",
                  scalingFactorWidth: 0.98,
                  scalingFactorHeight: 0.1,
                  roundedBottomLeft: true,
                  roundedBottomRight: true,
                  roundedTopLeft: false,
                  roundedTopRight: false,
                  onTap: () {
                    MyFunctions.NavigateTo(context, HomeView());
                  }
                ),
            );
  }
}
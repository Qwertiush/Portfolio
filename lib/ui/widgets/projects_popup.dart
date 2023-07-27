import 'package:cv/ui/common/app_colors.dart';
import 'package:cv/ui/common/ui_helpers.dart';
import 'package:cv/ui/widgets/custom_project_button_widget.dart';
import 'package:flutter/material.dart';

class ProjectsPopUp extends StatefulWidget {
  final String title;

  final List<CustomProjectButtonWidgetLarge> tiles;

  final double scalingFactorWidth;
  final double scalingFactorHeight;
  final VoidCallback onClose;

  const ProjectsPopUp({
    required this.title,

    required this.tiles,

    required this.scalingFactorWidth,
    required this.scalingFactorHeight,
    required this.onClose,
  });

  @override
  State<ProjectsPopUp> createState() => _ProjectsPopUpState();
}

class _ProjectsPopUpState extends State<ProjectsPopUp> with SingleTickerProviderStateMixin {
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
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * widget.scalingFactorHeight,
              maxWidth: MediaQuery.of(context).size.width * widget.scalingFactorWidth,
            ),
            color: kcDarkGreyColor,
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  verticalSpaceMedium,
                  Text(
                    widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getResponsiveMassiveFontSize(context),
                    ),
                  ),
                  verticalSpaceMedium,
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.tiles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: getResponsiveLargeFontSize(context)),
                          child: widget.tiles[index]
                          );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).padding.top,
          right: MediaQuery.of(context).padding.right,
          child: GestureDetector(
            onTap: widget.onClose,
            child: Icon(
              Icons.close_sharp,
              color: Colors.white,
              size: 100,
            ),
          ),
        ),
      ],
    );
  }
}

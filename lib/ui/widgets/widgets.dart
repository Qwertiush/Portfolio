import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/ui_helpers.dart';

class CustomBoxButtonWidgetLarge extends StatefulWidget {
  final Color color1;
  final Color color2;
  final String text;
  final double scalingFactorWidth;
  final double scalingFactorHeight;
  final bool roundedTopLeft;
  final bool roundedTopRight;
  final bool roundedBottomLeft;
  final bool roundedBottomRight;
  final VoidCallback? onTap;

  const CustomBoxButtonWidgetLarge({
    required this.color1,
    required this.color2,
    required this.text,
    required this.scalingFactorWidth,
    required this.scalingFactorHeight,
    required this.roundedTopLeft, required this.roundedTopRight, required this.roundedBottomLeft, required this.roundedBottomRight,
    this.onTap, 
  });

  @override
  _CustomBoxButtonWidgetLargeState createState() =>
      _CustomBoxButtonWidgetLargeState();
}

class _CustomBoxButtonWidgetLargeState
    extends State<CustomBoxButtonWidgetLarge> {
  bool isHovered = false;
  double degrees = 90;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          constraints: BoxConstraints(
            maxHeight:
                MediaQuery.of(context).size.height * widget.scalingFactorHeight,
            maxWidth:
                MediaQuery.of(context).size.width * widget.scalingFactorWidth,
          ),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: isHovered
                  ? [widget.color2, widget.color1]
                  : [widget.color1, widget.color2],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: widget.roundedTopLeft ? Radius.circular(degrees) : Radius.circular(0),
              topRight: widget.roundedTopRight ? Radius.circular(degrees) : Radius.circular(0),
              bottomLeft: widget.roundedBottomLeft ? Radius.circular(degrees) : Radius.circular(0),
              bottomRight: widget.roundedBottomRight ? Radius.circular(degrees) : Radius.circular(0),
            ),
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.text,
              style: TextStyle(
                color: kcWhite,
                fontSize: getResponsiveMassiveFontSize(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';

import '../common/app_colors.dart';
import '../common/ui_helpers.dart';

const double DEGREES = 90;

class CustomProjectButtonWidgetLarge extends StatefulWidget {
  final bool mobile;
  final Color color1;
  final Color color2;
  final String text;
  final String description;
  final String imagePath;
  final double scalingFactorWidth;
  final double scalingFactorHeight;
  final bool roundedTopLeft;
  final bool roundedTopRight;
  final bool roundedBottomLeft;
  final bool roundedBottomRight;
  final VoidCallback? onTap;

  const CustomProjectButtonWidgetLarge({
    required this.mobile,
    required this.color1,
    required this.color2,
    required this.text,
    required this.description,
    required this.imagePath,
    required this.scalingFactorWidth,
    required this.scalingFactorHeight,
    required this.roundedTopLeft, required this.roundedTopRight, required this.roundedBottomLeft, required this.roundedBottomRight,
    this.onTap, 
  });

  @override
  _CustomProjectButtonWidgetLargeState createState() =>
      _CustomProjectButtonWidgetLargeState();
}

class _CustomProjectButtonWidgetLargeState
    extends State<CustomProjectButtonWidgetLarge> {
  bool isHovered = false;

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
            topLeft: widget.roundedTopLeft ? Radius.circular(DEGREES) : Radius.circular(0),
            topRight: widget.roundedTopRight ? Radius.circular(DEGREES) : Radius.circular(0),
            bottomLeft: widget.roundedBottomLeft ? Radius.circular(DEGREES) : Radius.circular(0),
            bottomRight: widget.roundedBottomRight ? Radius.circular(DEGREES) : Radius.circular(0),
          ),
        ),
        child: !widget.mobile ? Row(
          children: [
            Flexible(
              flex: 70,
              fit: FlexFit.tight,
              child: ClipPath(
                clipper: RoundedCornerClipper(),
                child: Container(
                  color: kcDarkGreyColor,
                  child: Image.network(
                    widget.imagePath,
                    width: MediaQuery.of(context).size.height * widget.scalingFactorHeight,
                    height: MediaQuery.of(context).size.width * widget.scalingFactorWidth,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Center(
                        child: Text('Failed to load image'),
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container()
              ),
            Expanded(
              flex: 36,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.text,
                    style: TextStyle(
                      color: kcWhite,
                      fontSize: getResponsiveMassiveFontSize(context),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        color: kcWhite,
                        fontSize: getResponsiveMediumFontSize(context)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container()
            ),
          ],
        ) : 
        Column(
          children: [
            Flexible(
              flex: 70,
              fit: FlexFit.tight,
              child: ClipPath(
                clipper: RoundedCornerClipperMobile(),
                child: Container(
                  color: kcDarkGreyColor,
                  child: Image.network(
                    widget.imagePath,
                    width: MediaQuery.of(context).size.height * widget.scalingFactorHeight,
                    height: MediaQuery.of(context).size.width * widget.scalingFactorWidth,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                            : null,
                          ),
                        );
                      }
                    },
                    errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                      return Center(
                        child: Text('Failed to load image'),
                      );
                    },
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container()
              ),
            Expanded(
              flex: 26,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.text,
                    style: TextStyle(
                      color: kcWhite,
                      fontSize: getResponsiveMassiveFontSize(context),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        color: kcWhite,
                        fontSize: getResponsiveMediumFontSize(context)
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container()
            ),
          ],
        ),
      ),
    ),
  );
}
}


class RoundedCornerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final topLeftRadius = Radius.circular(DEGREES);
    final topRightRadius = Radius.zero;
    final bottomLeftRadius = Radius.circular(DEGREES);
    final bottomRightRadius = Radius.zero;

    path.addRRect(RRect.fromRectAndCorners(
      Rect.fromLTRB(0, 0, size.width, size.height),
      topLeft: topLeftRadius,
      topRight: topRightRadius,
      bottomLeft: bottomLeftRadius,
      bottomRight: bottomRightRadius,
    ));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class RoundedCornerClipperMobile extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final topLeftRadius = Radius.circular(DEGREES);
    final topRightRadius = Radius.circular(DEGREES);
    final bottomLeftRadius = Radius.circular(DEGREES);
    final bottomRightRadius = Radius.circular(DEGREES);

    path.addRRect(RRect.fromRectAndCorners(
      Rect.fromLTRB(0, 0, size.width, size.height),
      topLeft: topLeftRadius,
      topRight: topRightRadius,
      bottomLeft: bottomLeftRadius,
      bottomRight: bottomRightRadius,
    ));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
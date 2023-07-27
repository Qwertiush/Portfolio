import 'package:flutter/material.dart';

class MyFunctions {
  static void NavigateTo(BuildContext context, Widget widget) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 100),
        pageBuilder: (context, animation, secondaryAnimation) =>
            FadeTransition(
          opacity: animation,
          child: widget,
        ),
      ),
    );
  }
}

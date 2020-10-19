import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

@immutable
class CustomScrollBehavior extends ScrollBehavior {
  final bool isShowLeading;
  final bool isShowTrailing;
  final Color color;

  CustomScrollBehavior(this.isShowLeading, this.isShowTrailing, this.color);

  TargetPlatform getPlatform(BuildContext context) => defaultTargetPlatform;

  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    switch (getPlatform(context)) {
      case TargetPlatform.linux:
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.iOS:
        return child;
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return GlowingOverscrollIndicator(
          child: child,
          axisDirection: axisDirection,
          showLeading: isShowLeading ?? true,
          showTrailing: isShowTrailing ?? true,
          color: color ?? Colors.white,
        );
    }
    return null;
  }
}

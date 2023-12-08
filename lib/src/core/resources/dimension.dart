import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double h1FontSize = 18.sp;

double h2FontSize = 16.sp;

double h3FontSize = 14.sp;

double textFontSize = 13.sp;

double screenpadding = 12.w;

double yPaddingSmall = 6.h;

double xPaddingSmall = 6.w;

double xPadding = 16.w;

double yPadding = 16.h;

double buttonHeight = 45.h;

double buttonBorderRadius = 10.sp;

double textFieldBorderRadius = 6.sp;

class YSpace extends StatelessWidget {
  final double _height;
  const YSpace(this._height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height.h,
    );
  }
}

class XSpace extends StatelessWidget {
  final double _width;
  const XSpace(this._width, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _width.w,
    );
  }
}

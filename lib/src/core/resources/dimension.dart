import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

double h1FontSize = 18;

double h2FontSize = 16;

double h3FontSize = 14;

double textFontSize = 13;

double screenpadding = 12;

double yPaddingSmall = 6;

double xPaddingSmall = 6;

double xPadding = 16;

double yPadding = 16;

double buttonHeight = 45;

double buttonBorderRadius = 10;

double textFieldBorderRadius = 6;

void initDim() {
  h1FontSize = 18.sp;

  h2FontSize = 16.sp;

  h3FontSize = 14.sp;

  textFontSize = 13.sp;

  screenpadding = 12.w;

  yPaddingSmall = 6.h;

  xPaddingSmall = 6.w;

  xPadding = 16.w;

  yPadding = 16.h;

  buttonHeight = 45.h;

  buttonBorderRadius = 10.sp;

  textFieldBorderRadius = 6.sp;
}

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

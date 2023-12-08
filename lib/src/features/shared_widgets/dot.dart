import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/src/core/resources/resources.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      height: 3.w,
      width: 3.w,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: kTextColor2),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/src/features/calculate/calculate.dart';
import 'package:moniepoint_test/src/features/home/widgets/home_widgets.dart';
import 'package:moniepoint_test/src/features/shared_widgets/animated_view.dart';
import 'package:moniepoint_test/src/features/shared_widgets/bottom_nav.dart';
import 'package:moniepoint_test/src/core/resources/assets.dart';
import 'package:moniepoint_test/src/core/resources/dimension.dart';
import 'package:moniepoint_test/src/core/resources/text_theme.dart';

class EstimateScreen extends StatefulWidget {
  const EstimateScreen({super.key});

  @override
  State<EstimateScreen> createState() => _EstimateScreenState();
}

class _EstimateScreenState extends State<EstimateScreen>
    with TickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1400.0, end: 1500.0)
        .animate(_animationController!);

    _animationController!.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppAnimatedColumn(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ImageWidget(
            path: moveLogoPng,
            height: 30.h,
          ),
          YSpace(buttonHeight),
          ImageWidget(
            path: boxBigPng,
            height: 150.h,
          ),
          YSpace(buttonHeight),
          Text(
            'Total Estimated Amount',
            style: context.bodyLarge.copyWith(fontSize: h1FontSize),
          ),
          YSpace(yPaddingSmall),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: const Duration(seconds: 2),
            builder: (context, double value, child) {
              return Center(
                child: RichText(
                  text: TextSpan(
                      text:
                          '\$${(_animation!.value * value).toStringAsFixed(0)}',
                      style: context.bodyMedium
                          .copyWith(color: Colors.green, fontSize: h1FontSize),
                      children: [
                        TextSpan(
                            text: ' USD',
                            style: context.bodyLarge.copyWith(
                              color: Colors.green,
                            ))
                      ]),
                ),
              );
            },
          ),
          YSpace(yPaddingSmall),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 60.w),
            child: Text(
              'This amount is estimated, it will vary if you change your location or weight',
              textAlign: TextAlign.center,
              style: context.bodyMedium.copyWith(),
            ),
          ),
          YSpace(buttonHeight),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: xPadding),
            child: AppButton(
              onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavigationWidget()));
              },
              text: 'Back To Home',
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/src/features/calculate/calculate.dart';
import 'package:moniepoint_test/src/features/home/widgets/home_widgets.dart';
import 'package:moniepoint_test/src/features/shared_widgets/widgets.dart';
import 'package:moniepoint_test/src/core/resources/assets.dart';
import 'package:moniepoint_test/src/core/resources/colors.dart';
import 'package:moniepoint_test/src/core/resources/dimension.dart';
import 'package:moniepoint_test/src/core/resources/text_theme.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
    required this.onTabTapped,
  });
  final void Function(int) onTabTapped;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        leading: GestureDetector(
            onTap: () {
              setState(() {
                widget.onTabTapped(0);
              });
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: kColorWhite,
            )),
        title: Text(
          'Profile',
          style: context.bodyMedium.copyWith(
              color: kColorWhite,
              fontWeight: FontWeight.w300,
              fontSize: h2FontSize),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 1,
        child: AppButton(
          text: 'Logout',
          onTap: () {},
        ),
      ),
      body: SingleChildScrollView(
        child: AppAnimatedColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: xPadding),
              child: const HeaderTexts('Profile Details'),
            ),
            PrimaryContainer(
                horizontalPadding: xPadding,
                child: Column(
                  children: [
                    MoniepointTextField(
                        hintText: 'Mubiyn',
                        readOnly: true,
                        prefixIcon: ClipRRect(
                          borderRadius: BorderRadius.circular(50.sp),
                          child: ImageWidget(
                            path: avatarPng,
                            height: 25.h,
                          ),
                        ),
                        validator: (s) => null),
                    MoniepointTextField(
                        hintText: 'Lagos, Nigeria',
                        readOnly: true,
                        prefixIcon: ImageWidget(
                          path: receiverLocationPng,
                          height: 25.h,
                        ),
                        validator: (s) => null),
                    MoniepointTextField(
                        bottomPadding: 0,
                        hintText: '08140623360',
                        readOnly: true,
                        prefixIcon: ClipRRect(
                          borderRadius: BorderRadius.circular(50.sp),
                          child: ImageWidget(
                            path: senderLocationPng,
                            height: 25.h,
                          ),
                        ),
                        validator: (s) => null)
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

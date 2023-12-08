import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/src/features/home/data/dummy_data.dart';
import 'package:moniepoint_test/src/features/shared_widgets/widgets.dart';
import 'package:moniepoint_test/src/core/resources/assets.dart';
import 'package:moniepoint_test/src/core/resources/colors.dart';
import 'package:moniepoint_test/src/core/resources/dimension.dart';
import 'package:moniepoint_test/src/core/resources/text_theme.dart';
import 'package:moniepoint_test/src/core/resources/ui_helpers.dart';

class PrimaryContainer extends StatelessWidget {
  const PrimaryContainer({
    super.key,
    required this.child,
    this.verticalPadding,
    this.horizontalPadding = 0,
    this.margin,
  });
  final Widget child;
  final double? verticalPadding, horizontalPadding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding ?? yPadding,
          horizontal: horizontalPadding!),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(buttonBorderRadius),
        boxShadow: const [
          BoxShadow(
            color: kColorGreyLight,
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes the position of the shadow
          ),
        ],
      ),
      child: child,
    );
  }
}

class UserTileWidget extends StatelessWidget {
  const UserTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final user = dummyUser;
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: kColorGrey,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(buttonBorderRadius),
            child: ImageWidget(
              path: user.image,
            ),
          )),
      title: Row(
        children: [
          Transform.rotate(
            angle: 45 * (pi / 180),
            child: Icon(
              Icons.navigation,
              size: 14.sp,
              color: kColorWhite.withOpacity(0.6),
            ),
          ),
          Text(
            'Your Location',
            style: context.bodyMedium
                .copyWith(color: kColorWhite.withOpacity(0.6)),
          )
        ],
      ),
      subtitle: Row(
        children: [
          Text(
            '${user.address} ',
            style: context.bodyMedium.copyWith(
              color: kColorWhite,
              fontSize: h3FontSize,
            ),
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: kColorWhite,
            size: 14.sp,
          ),
        ],
      ),
      trailing: CircleAvatar(
          backgroundColor: kColorWhite,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(buttonBorderRadius),
            child: ImageWidget(
              path: notificationPng,
              height: 25.h,
            ),
          )),
    );
  }
}

class AvailableVehiclesCard extends StatelessWidget {
  const AvailableVehiclesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderTexts(
          'Available Vehicles',
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: AppAnimatedRow(
            children: [
              ...List.generate(
                vehicles.length,
                (index) => Container(
                  height: screenHeight(context) * 0.25,
                  width: screenWidth(context) * 0.37,
                  padding: EdgeInsets.symmetric(vertical: yPadding),
                  margin: EdgeInsets.only(
                    right: xPadding * 0.7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(buttonBorderRadius),
                    boxShadow: const [
                      BoxShadow(
                        color: kColorGreyLight,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset:
                            Offset(0, 3), // changes the position of the shadow
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(top: yPadding * 1.5),
                            child: ImageWidget(
                              path: vehicles[index].image,
                              height: buttonHeight * 2.5,
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: xPadding),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              vehicles[index].name,
                              style: context.displaySmall
                                  .copyWith(fontWeight: FontWeight.w400),
                            ),

                            Text(
                              vehicles[index].range,
                              style: context.bodySmall,
                            ),
                            //
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TrackingCardWidget extends StatelessWidget {
  const TrackingCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderTexts(
          'Tracking',
        ),
        PrimaryContainer(
          child: AppAnimatedColumn(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: xPadding, right: yPaddingSmall),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shipment Number',
                          style: context.bodySmall
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        YSpace(yPaddingSmall),
                        Text(
                          dummyTrackingItem.shipmentNumber,
                          style: context.bodyLarge
                              .copyWith(fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                    ImageWidget(
                      path: trolleyPng,
                      height: buttonHeight,
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: xPadding * 0.7, left: xPadding),
                child: const Divider(
                  thickness: 0.2,
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: xPadding),
                  child: Column(children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TrackingItemDetail(
                          description: dummyTrackingItem.senderAddress,
                          imgPath: receivePng,
                          title: 'Sender',
                        ),
                        TrackingItemDetail(
                          hasDot: true,
                          description: dummyTrackingItem.time,
                          title: 'Time',
                        ),
                      ],
                    ),
                    YSpace(buttonHeight * 0.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TrackingItemDetail(
                          description: dummyTrackingItem.receiverAddress,
                          imgPath: sendPng,
                          title: 'Receiver',
                        ),
                        TrackingItemDetail(
                          description: dummyTrackingItem.status,
                          title: 'Status',
                        )
                      ],
                    ),
                    YSpace(buttonHeight * 0.4),
                    const Divider(
                      thickness: 0.2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add,
                          color: kColorOrange,
                        ),
                        Text(
                          'Add Stop',
                          style:
                              context.bodyLarge.copyWith(color: kColorOrange),
                        )
                      ],
                    )
                  ])),
            ],
          ),
        ),
      ],
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
    this.onTap,
    this.onChanged,
    this.onSubmit,
    this.height,
    this.width,
  });
  final VoidCallback? onTap;
  final void Function(String)? onChanged, onSubmit;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: xPadding),
      child: SizedBox(
        height: height ?? 50.h,
        width: width,
        child: SearchBar(
          elevation: const MaterialStatePropertyAll(0),
          hintText: 'Enter the receipt number...',
          onChanged: onChanged,
          onTap: onTap,
          onSubmitted: onSubmit,
          leading: Padding(
            padding: EdgeInsets.only(left: xPaddingSmall),
            child: const Icon(
              Icons.search,
              color: kPrimaryColor,
            ),
          ),
          trailing: [
            CircleAvatar(
                backgroundColor: kColorOrange,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(buttonBorderRadius),
                  child: ImageWidget(
                    path: searchPng,
                    height: 25.h,
                  ),
                ))
          ],
          hintStyle: MaterialStatePropertyAll(context.bodyMedium),
        ),
      ),
    );
  }
}

class TrackingItemDetail extends StatelessWidget {
  const TrackingItemDetail({
    super.key,
    required this.title,
    required this.description,
    this.hasDot = false,
    this.imgPath,
  });
  final String title, description;
  final bool? hasDot;
  final String? imgPath;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth(context) * 0.4,
      child: Row(
        children: [
          if (imgPath != null)
            Row(
              children: [
                ImageWidget(
                  path: imgPath!,
                  height: buttonHeight * 0.85,
                ),
                XSpace(xPaddingSmall),
              ],
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: context.bodySmall.copyWith(fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  if (hasDot!)
                    Container(
                      margin: EdgeInsets.only(right: 2.w),
                      height: 5.w,
                      width: 5.w,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.green),
                    ),
                  Text(
                    description,
                    style: context.bodyLarge,
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    super.key,
    required this.path,
    this.height,
    this.width,
  });
  final String path;
  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      path,
      height: height,
      width: width,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/src/features/home/data/dummy_data.dart';
import 'package:moniepoint_test/src/features/home/data/model.dart';
import 'package:moniepoint_test/src/features/home/widgets/home_widgets.dart';
import 'package:moniepoint_test/src/features/shared_widgets/widgets.dart';
import 'package:moniepoint_test/src/core/resources/assets.dart';
import 'package:moniepoint_test/src/core/resources/colors.dart';
import 'package:moniepoint_test/src/core/resources/dimension.dart';
import 'package:moniepoint_test/src/core/resources/text_theme.dart';
import 'package:moniepoint_test/src/core/resources/ui_helpers.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    super.key,
    required this.onSearchTapped,
  });
  final VoidCallback onSearchTapped;

  @override
  Widget build(BuildContext context) {
    return AppAnimatedColumn(
      children: [
        Container(
          padding: EdgeInsets.only(top: yPadding * 2, bottom: yPadding),
          height: screenHeight(context) * 0.23,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const UserTileWidget(),
              Stack(
                children: [
                  const SearchWidget(),
                  GestureDetector(
                    onTap: onSearchTapped,
                    child: Container(
                      height: 50.h,
                      margin: EdgeInsets.symmetric(horizontal: xPadding),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(25.sp),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: screenpadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TrackingCardWidget(),
              const AvailableVehiclesCard(),
              YSpace(yPadding)
            ],
          ),
        )
      ],
    );
  }
}

class SearchingScreenWidget extends StatelessWidget {
  const SearchingScreenWidget({
    super.key,
    required this.onBackPress,
    this.onChanged,
    required this.searchingList,
  });
  final VoidCallback onBackPress;
  final void Function(String)? onChanged;
  final List<SearchItem> searchingList;

  @override
  Widget build(BuildContext context) {
    return AppAnimatedColumn(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: yPadding * 2,
            bottom: yPadding,
            left: xPadding,
          ),
          height: screenHeight(context) * 0.13,
          decoration: const BoxDecoration(
            color: kPrimaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: onBackPress,
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: kColorWhite,
                  )),
              SearchWidget(
                onChanged: onChanged,
                width: screenWidth(context) * 0.8,
              ),
            ],
          ),
        ),
        YSpace(yPadding),
        PrimaryContainer(
          margin: EdgeInsets.symmetric(horizontal: xPadding),
          child: SingleChildScrollView(
              child: AppAnimatedColumn(children: [
            if (searchingList.isNotEmpty)
              ...searchingList.map((e) => SearchHistoryItem(
                    e: e,
                  ))
            else
              ...searchItems.map((e) => SearchHistoryItem(
                    e: e,
                  )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: xPadding),
                child: const Divider(thickness: 0.2))
          ])),
        ),
      ],
    );
  }
}

class SearchHistoryItem extends StatelessWidget {
  const SearchHistoryItem({
    super.key,
    required this.e,
  });
  final SearchItem e;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
          backgroundColor: kPrimaryColor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(buttonBorderRadius),
            child: ImageWidget(
              path: historyBoxPng,
              height: 30.h,
            ),
          )),
      title: Text(
        e.name,
        style: context.displaySmall.copyWith(fontWeight: FontWeight.w700),
      ),
      subtitle: Row(
        children: [
          Text(
            '#${e.shipmentNumber} ',
            style: context.bodySmall,
          ),
          const DotWidget(),
          Text(
            ' ${e.senderAddress} -> ${e.receiverAddress}',
            style: context.bodySmall,
          ),
        ],
      ),
    );
  }
}

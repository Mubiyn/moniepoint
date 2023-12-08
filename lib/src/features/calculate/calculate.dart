import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/src/features/calculate/data/dummy_data.dart';
import 'package:moniepoint_test/src/features/calculate/estimate.dart';
import 'package:moniepoint_test/src/features/home/widgets/home_widgets.dart';
import 'package:moniepoint_test/src/features/shared_widgets/widgets.dart';
import 'package:moniepoint_test/src/core/resources/assets.dart';
import 'package:moniepoint_test/src/core/resources/colors.dart';
import 'package:moniepoint_test/src/core/resources/dimension.dart';
import 'package:moniepoint_test/src/core/resources/text_theme.dart';
import 'package:moniepoint_test/src/core/resources/ui_helpers.dart';

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({
    super.key,
    required this.onTabTapped,
  });
  final void Function(int) onTabTapped;

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  String? sendingItem;
  String selectedCategory = '';
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: index,
      children: [
        Scaffold(
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
              'Calculate',
              style: context.bodyMedium.copyWith(
                  color: kColorWhite,
                  fontWeight: FontWeight.w300,
                  fontSize: h2FontSize),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            elevation: 1,
            child: AppButton(
              text: 'Calculate',
              onTap: () {
                setState(() {
                  index = 1;
                });
              },
            ),
          ),
          body: SingleChildScrollView(
            child: AppAnimatedColumn(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: xPadding),
                  child: const HeaderTexts('Destination'),
                ),
                PrimaryContainer(
                    horizontalPadding: xPadding,
                    child: Column(
                      children: [
                        MoniepointTextField(
                            hintText: 'Sender Location',
                            prefixIcon: ImageWidget(
                              path: senderLocationPng,
                              height: 25.h,
                            ),
                            validator: (s) => null),
                        MoniepointTextField(
                            hintText: 'Receiver Location',
                            prefixIcon: ImageWidget(
                              path: receiverLocationPng,
                              height: 25.h,
                            ),
                            validator: (s) => null),
                        MoniepointTextField(
                            bottomPadding: 0,
                            hintText: 'Approximate Weight',
                            prefixIcon: ImageWidget(
                              path: weightPng,
                              height: 25.h,
                            ),
                            validator: (s) => null)
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: xPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderTexts(
                        'Packaging',
                        bottomPadding: yPaddingSmall,
                      ),
                      Text(
                        'What are you sending?',
                        style: context.bodyMedium,
                      ),
                      YSpace(24.h),
                      MoniePointDropDownField(
                          hintText: 'Select Item',
                          prefixIcon: ImageWidget(
                            path: boxSmallPng,
                            height: 28.h,
                          ),
                          dropdownItems: const ['Box', 'Bag', 'File', 'Parcel'],
                          onChanged: (s) {
                            sendingItem = s;
                            setState(() {});
                          },
                          value: sendingItem)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: xPadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HeaderTexts(
                        'Categories',
                        bottomPadding: yPaddingSmall,
                      ),
                      Text(
                        'What are you sending?',
                        style: context.bodyMedium,
                      ),
                      YSpace(24.h),
                      Wrap(
                        children: [
                          ...itemCategories.map((e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedCategory = e;
                                  });
                                },
                                child: AnimatedContainer(
                                    curve: Curves.linear,
                                    margin: EdgeInsets.only(
                                        right: 12.w, bottom: 12.h),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: selectedCategory == e
                                            ? xPadding
                                            : xPaddingSmall,
                                        vertical: selectedCategory == e
                                            ? yPadding * 0.5
                                            : yPadding * 0.4),
                                    decoration: BoxDecoration(
                                        color: selectedCategory == e
                                            ? kColorBlack
                                            : kColorWhite,
                                        border: Border.all(color: kTextColor2),
                                        borderRadius: BorderRadius.circular(
                                            textFieldBorderRadius)),
                                    duration: const Duration(milliseconds: 400),
                                    child: CategoryTextWidget(
                                      selected: selectedCategory == e,
                                      text: e,
                                    )),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const EstimateScreen()
      ],
    );
  }
}

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
  });
  final VoidCallback onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(screenWidth(context), 55)),
          backgroundColor: const MaterialStatePropertyAll(kColorOrange)),
      child: Text(
        text,
        style: context.displayMedium.copyWith(color: kColorWhite),
      ),
    );
  }
}

class CategoryTextWidget extends StatelessWidget {
  const CategoryTextWidget({
    super.key,
    required this.text,
    required this.selected,
  });
  final String text;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (selected)
          Icon(
            Icons.done,
            color: kColorWhite,
            size: 14.sp,
          ),
        Text(' $text',
            style: context.bodyLarge
                .copyWith(color: selected ? kColorWhite : kTextColor1))
      ],
    );
  }
}

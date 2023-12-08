import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/src/features/history/data/dummy_data.dart';
import 'package:moniepoint_test/src/features/history/data/model.dart';
import 'package:moniepoint_test/src/features/home/widgets/home_widgets.dart';
import 'package:moniepoint_test/src/features/shared_widgets/widgets.dart';
import 'package:moniepoint_test/src/core/resources/assets.dart';
import 'package:moniepoint_test/src/core/resources/colors.dart';
import 'package:moniepoint_test/src/core/resources/dimension.dart';
import 'package:moniepoint_test/src/core/resources/text_theme.dart';
import 'package:moniepoint_test/src/core/resources/ui_helpers.dart';

class HistoryWidget extends StatefulWidget {
  const HistoryWidget({
    super.key,
    required this.onTabTapped,
  });
  final void Function(int) onTabTapped;

  @override
  State<HistoryWidget> createState() => _HistoryWidgetState();
}

class _HistoryWidgetState extends State<HistoryWidget> {
  int _selectedTab = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
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
            'Shipment History',
            style: context.bodyMedium.copyWith(
                color: kColorWhite,
                fontWeight: FontWeight.w300,
                fontSize: h2FontSize),
          ),
          bottom: TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              onTap: (s) {
                setState(() {
                  _selectedTab = s;
                });
              },
              unselectedLabelColor: kColorWhite.withOpacity(0.5),
              labelColor: kColorWhite,
              labelStyle:
                  context.bodyMedium.copyWith(fontWeight: FontWeight.w600),
              unselectedLabelStyle: context.bodyMedium,
              indicatorSize: TabBarIndicatorSize.label,
              dividerColor: Colors.transparent,
              indicator: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: kColorOrange, width: 4.0),
                ),
              ),
              tabs: [
                ...historyTabs.map((e) {
                  int count = 0;
                  String name = '';
                  switch (e) {
                    case 0:
                      name = 'All';
                      count = historylist.length;
                      break;
                    case 1:
                      name = 'Completed';
                      count = completedList.length;
                      break;
                    case 2:
                      name = 'In Progress';
                      count = inProgressList.length;
                      break;
                    case 3:
                      name = 'Pending';
                      count = pendingList.length;
                      break;
                    case 4:
                      name = 'Cancelled';
                      count = cancelledList.length;
                      break;
                    default:
                  }
                  return Tab(
                    child: HistoryTabItem(
                      title: name,
                      count: count.toString(),
                      selected: _selectedTab == e,
                    ),
                  );
                })
              ]),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: xPadding),
              child: const HeaderTexts('Shipments'),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SingleChildScrollView(
                    child: AppAnimatedColumn(children: [
                      ...historylist.map((e) {
                        Color cardColor = Colors.white;
                        IconData icon = Icons.abc;
                        switch (e.status) {
                          case 'Pending':
                            cardColor = kColorOrange;
                            icon = Icons.donut_large_outlined;
                            break;
                          case 'All':
                            cardColor = kColorOrange;
                            icon = Icons.all_out;
                            break;
                          case 'Completed':
                            cardColor = Colors.blue;
                            icon = Icons.done_outline_outlined;
                            break;
                          case 'In-Progress':
                            cardColor = Colors.green;
                            icon = Icons.move_up_outlined;
                            break;
                          case 'Cancelled':
                            cardColor = Colors.red.withOpacity(0.7);
                            icon = Icons.cancel;
                            break;
                          default:
                        }
                        return HistoryCardWidget(
                          icon: icon,
                          cardColor: cardColor,
                          history: e,
                        );
                      }),
                    ]),
                  ),

                  //completed

                  SingleChildScrollView(
                    child: AppAnimatedColumn(children: [
                      ...completedList.map((e) {
                        Color cardColor = Colors.blue;
                        IconData icon = Icons.done_outline_outlined;
                        return HistoryCardWidget(
                          icon: icon,
                          cardColor: cardColor,
                          history: e,
                        );
                      }),
                    ]),
                  ),
                  //in progress
                  SingleChildScrollView(
                    child: AppAnimatedColumn(children: [
                      ...inProgressList.map((e) {
                        Color cardColor = Colors.blue;
                        IconData icon = Icons.done_outline_outlined;
                        return HistoryCardWidget(
                          icon: icon,
                          cardColor: cardColor,
                          history: e,
                        );
                      }),
                    ]),
                  ),

                  //pending
                  SingleChildScrollView(
                    child: AppAnimatedColumn(children: [
                      ...pendingList.map((e) {
                        Color cardColor = Colors.blue;
                        IconData icon = Icons.done_outline_outlined;
                        return HistoryCardWidget(
                          icon: icon,
                          cardColor: cardColor,
                          history: e,
                        );
                      }),
                    ]),
                  ),

                  //cancelled
                  SingleChildScrollView(
                    child: AppAnimatedColumn(children: [
                      ...cancelledList.map((e) {
                        Color cardColor = Colors.blue;
                        IconData icon = Icons.done_outline_outlined;
                        return HistoryCardWidget(
                          icon: icon,
                          cardColor: cardColor,
                          history: e,
                        );
                      }),
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryCardWidget extends StatelessWidget {
  const HistoryCardWidget({
    super.key,
    required this.icon,
    required this.cardColor,
    required this.history,
  });

  final IconData icon;
  final Color cardColor;
  final HistoryItem history;

  @override
  Widget build(BuildContext context) {
    return PrimaryContainer(
        margin:
            EdgeInsets.only(left: xPadding, right: xPadding, bottom: yPadding),
        horizontalPadding: xPadding,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: yPaddingSmall),
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
                  decoration: BoxDecoration(
                      color: kColorGrey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10.sp)),
                  child: Row(mainAxisSize: MainAxisSize.min, children: [
                    Icon(
                      icon,
                      color: cardColor,
                    ),
                    Text(
                      ' ${history.status}',
                      style: context.bodySmall.copyWith(
                          color: cardColor, fontWeight: FontWeight.bold),
                    )
                  ]),
                ),
                Text(
                  '${history.arrivalText}!',
                  style:
                      context.bodyLarge.copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: screenWidth(context) * 0.6,
                  child: Text('${history.description}!',
                      style: context.bodySmall
                          .copyWith(fontSize: textFontSize * 0.8)),
                ),
                Row(
                  children: [
                    Text('\$${history.price}USD ',
                        style: context.bodyLarge.copyWith(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: textFontSize * 0.8)),
                    const DotWidget(),
                    Text(' ${history.data}',
                        style: context.bodySmall
                            .copyWith(fontSize: textFontSize * 0.8)),
                  ],
                ),
              ],
            ),
            ImageWidget(
              path: boxMediumPng,
              height: buttonHeight * 1.3,
            )
          ],
        ));
  }
}

class HistoryTabItem extends StatelessWidget {
  const HistoryTabItem({
    super.key,
    required this.title,
    required this.count,
    required this.selected,
  });
  final String title, count;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(title),
        Container(
          margin: EdgeInsets.only(left: xPaddingSmall),
          alignment: Alignment.center,
          height: yPadding * 1.2,
          width: xPadding * 1.6,
          decoration: BoxDecoration(
              color: selected ? kColorOrange : kColorWhite.withOpacity(0.3),
              borderRadius: BorderRadius.circular(buttonBorderRadius)),
          child: Text(
            count,
          ),
        ),
      ],
    );
  }
}

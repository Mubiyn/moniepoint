import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/features/calculate/calculate.dart';
import 'package:moniepoint_test/src/features/history/history.dart';
import 'package:moniepoint_test/src/features/home/home.dart';
import 'package:moniepoint_test/src/features/profile/profile.dart';
import 'package:moniepoint_test/src/core/resources/colors.dart';
import 'package:moniepoint_test/src/core/resources/text_theme.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  bool showBottomNav = true;
  @override
  void initState() {
    tabController = TabController(
        length: 4,
        vsync: this,
        animationDuration: const Duration(milliseconds: 400));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: showBottomNav,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        bottomNavigationBar: !showBottomNav
            ? const SizedBox.shrink()
            : Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [BoxShadow(color: Colors.grey)]),
                child: TabBar(
                  controller: tabController,
                  dividerHeight: 0,
                  onTap: onTabTapped,
                  tabs: const [
                    Tab(
                      child: BottomBarIcon(icon: Icons.home, label: 'Home'),
                    ),
                    Tab(
                      child: BottomBarIcon(
                          icon: Icons.calculate, label: 'Calculate'),
                    ),
                    Tab(
                      child:
                          BottomBarIcon(icon: Icons.history, label: 'Shipment'),
                    ),
                    Tab(
                      child:
                          BottomBarIcon(icon: Icons.person, label: 'Profile'),
                    ),
                  ],
                  labelPadding: const EdgeInsets.only(top: 10, bottom: 15),
                  unselectedLabelColor: kColorGrey,
                  labelStyle: context.bodyMedium.copyWith(
                      color: kPrimaryColor, fontWeight: FontWeight.w600),
                  unselectedLabelStyle:
                      context.bodyMedium.copyWith(color: kColorGreyLight),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: Theme.of(context).primaryColor, width: 4.0),
                    ),
                  ),
                ),
              ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            const HomePage(),
            CalculateScreen(
              onTabTapped: (s) {
                onTabTapped(s);
              },
            ),
            HistoryWidget(
              onTabTapped: (s) {
                onTabTapped(s);
              },
            ),
            ProfileScreen(
              onTabTapped: (s) {
                onTabTapped(s);
              },
            ),
          ],
        ),
      ),
    );
  }

  void onTabTapped(int s) {
    Timer(const Duration(milliseconds: 100), () {
      if (s != 0) {
        showBottomNav = false;
      } else {
        showBottomNav = true;
      }
      setState(() {});
    });
    tabController!.animateTo(s);
  }
}

class BottomBarIcon extends StatelessWidget {
  const BottomBarIcon({
    super.key,
    required this.label,
    required this.icon,
  });
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon),
        Text(
          label,
        )
      ],
    );
  }
}

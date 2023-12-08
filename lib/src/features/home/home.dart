import 'package:flutter/material.dart';
import 'package:moniepoint_test/src/features/home/data/dummy_data.dart';
import 'package:moniepoint_test/src/features/home/data/model.dart';
import 'package:moniepoint_test/src/features/home/widgets/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isSearching = false;
  final List<SearchItem> _searchList = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: AnimatedCrossFade(
        duration: const Duration(milliseconds: 400),
        crossFadeState: !_isSearching
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        reverseDuration: const Duration(milliseconds: 400),
        firstCurve: Curves.linear,
        secondCurve: Curves.linear,
        firstChild: HomeWidget(
          onSearchTapped: () {
            setState(() {
              _isSearching = true;
            });
          },
        ),
        secondChild: SearchingScreenWidget(
          searchingList: _searchList,
          onBackPress: () {
            setState(() {
              _isSearching = false;
            });
          },
          onChanged: (s) {
            for (final element in searchItems) {
              if (element.shipmentNumber
                  .toLowerCase()
                  .contains(s.toLowerCase())) {
                if (!_searchList.contains(element)) {
                  _searchList.add(element);
                }
              } else {
                _searchList.remove(element);
              }
            }
            setState(() {});
          },
        ),
      ),
    );
  }
}

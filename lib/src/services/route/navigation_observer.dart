import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moniepoint_test/src/services/route/route_observer.dart';

class MoniepointNavigationService {
  const MoniepointNavigationService._();

  /// Returns the [Get.key] value to be set in the applications navigation
  static GlobalKey<NavigatorState>? get navigatorKey => Get.key;

  /// Creates and/or returns a new navigator key based on the index passed in
  static GlobalKey<NavigatorState>? nestedNavigationKey(int index) =>
      Get.nestedKey(index);

  /// Returns the [GetObserver] to be passed through navigatorObservers in MaterialApp to use all the functionalities
  static NavigatorObserver get routeObserver => MoniepointRouteObserver();
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:moniepoint_test/src/core/containers/app_injection_container.dart';
import 'package:moniepoint_test/src/features/home/widgets/home_widgets.dart';
import 'package:moniepoint_test/src/core/resources/resources.dart';
import 'package:moniepoint_test/src/services/route/navigation_observer.dart';
import 'package:moniepoint_test/src/features/shared_widgets/bottom_nav.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInjectionContainer.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 800),
      builder: (context, _) => MaterialApp(
        title: 'Flutter Demo',
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: moniepointSettingService.themeMode.value,
        debugShowCheckedModeBanner: false,
        navigatorKey: MoniepointNavigationService.navigatorKey,
        navigatorObservers: [MoniepointNavigationService.routeObserver],
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToDashboard();
    super.initState();
  }

  void goToDashboard() async {
    await Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const BottomNavigationWidget()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: xPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImageWidget(
              path: moveLogoPng,
              height: buttonHeight * 0.7,
            ),
            YSpace(yPadding * 2),
            const LinearProgressIndicator()
          ],
        ),
      ),
    );
  }
}

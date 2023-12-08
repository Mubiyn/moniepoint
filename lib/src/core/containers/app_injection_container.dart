import 'package:get_it/get_it.dart';
import 'package:moniepoint_test/src/services/theme/theme_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
final sharedPrefs = sl<SharedPreferences>();
MoniepointSettingsService get moniepointSettingService =>
    sl<MoniepointSettingsService>();

class AppInjectionContainer {
  static Future<void> init() async {
    //general dependencies
    final sharedPrefs = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
    sl.registerLazySingleton<MoniepointSettingsService>(
        () => MoniepointSettingsService());
  }
}

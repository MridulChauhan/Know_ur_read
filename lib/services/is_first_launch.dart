import 'package:knowurread/main_screens/features_screen.dart';
import 'package:knowurread/main_screens/text_scanner_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IsFirstLaunch {
  Future<bool> isFirstLaunch(var screen) async {
    if (screen == TextScannerScreen) {
      final sharedPreferences = await SharedPreferences.getInstance();
      bool isFirstLaunch = sharedPreferences
              .getBool(TextScannerScreen.PREFERENCES_IS_FIRST_LAUNCH_STRING) ??
          true;
      if (isFirstLaunch)
        sharedPreferences.setBool(
            TextScannerScreen.PREFERENCES_IS_FIRST_LAUNCH_STRING, false);

      return isFirstLaunch;
    }
    if (screen == FeaturesPage) {
      final sharedPreferences = await SharedPreferences.getInstance();
      bool isFirstLaunch = sharedPreferences
              .getBool(FeaturesPage.PREFERENCES_IS_FIRST_LAUNCH_STRING) ??
          true;

      if (isFirstLaunch)
        sharedPreferences.setBool(
            FeaturesPage.PREFERENCES_IS_FIRST_LAUNCH_STRING, false);

      return isFirstLaunch;
    }
    return true;
  }
}

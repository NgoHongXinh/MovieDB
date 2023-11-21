import 'package:flutter/material.dart';

import '../../core/public/until.dart';

class ApplicationNotifier with ChangeNotifier {
  ThemeData themeDefaultData = ThemeData(

      appBarTheme: const AppBarTheme(centerTitle: true));
  GlobalKey<NavigatorState> materialKey = GlobalKey<NavigatorState>();

  /// Láy device ID

  ApplicationNotifier(BuildContext context) {
    Utils.getDeviceId().then((deviceId) {
      deviceId = Utils.sha256Convert(deviceId ?? '' "bo").toString();
    });
  }
}
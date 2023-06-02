import 'package:flutter/material.dart';

import '../../view/page/app_page.dart';
import '../../view/page/auth_page.dart';
import '../../view/page/init_page.dart';
import 'const.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> list() {
    return {
      initPage: (context) => const InitPage(),
      authPage: (context) => const AuthPage(),
      appPage: (context) => const AppPage(),
    };
  }
}

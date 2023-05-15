import 'package:flutter/material.dart';

import '../../view/page/init_page.dart';
import 'const.dart';

class Routes {
  static Map<String, Widget Function(BuildContext context)> list() {
    return {
      initPage: (context) => const InitPage(),
    };
  }
}

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get_it/get_it.dart';

import 'common/config/routes.dart';
import 'common/config/style.dart';
import 'common/helper/network.dart';
import 'common/helper/simple_bloc_observer.dart';
import 'controller/config_controller.dart';
import 'firebase_options.dart';

void main() async {
  await _bootstrapping();

  runApp(const Gocery());
}

class Gocery extends StatelessWidget {
  const Gocery({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobku',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: Style.light,
      darkTheme: Style.dark,
      routes: Routes.list(),
    );
  }
}

Future<void> _bootstrapping() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = SimpleBlocObserver();

  AwesomeNotifications().initialize(
    // set the icon to null if you want to use the default app icon
    null,
    [
      NotificationChannel(
        channelGroupKey: 'default_channel_group',
        channelKey: 'importance_channel',
        channelName: 'Importance Notification',
        channelDescription: 'Notification setting for importance information',
        defaultColor: Colors.red,
        ledColor: Colors.red,
        importance: NotificationImportance.Max,
      ),
      NotificationChannel(
        channelGroupKey: 'default_channel_group',
        channelKey: 'service_channel',
        channelName: 'Service Notification',
        channelDescription: 'Notification setting for foreground service',
        defaultColor: Colors.red,
        ledColor: Colors.red,
      ),
    ],
    // Channel groups are only visual and are not required
    channelGroups: [
      NotificationChannelGroup(
        channelGroupkey: 'default_channel_group',
        channelGroupName: 'Group',
      )
    ],
    debug: true,
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: ".env");
  await _preCacheAsset();
  await _services();
}

Future<void> _services() async {
  final getIt = GetIt.instance;

  getIt.registerLazySingleton(() => ConfigController());
  getIt.registerLazySingleton<Network>(() => NetworkClient());
}

Future<void> _preCacheAsset() async {
//   await Future.wait([
//     precachePicture(
//       ExactAssetPicture(
//         SvgPicture.svgStringDecoderBuilder,
//         mobkuLogoSideBlack,
//       ),
//       null,
//     ),
//   ]);
}

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sizer/sizer.dart';

import 'common/config/routes.dart';
import 'common/config/style.dart';
import 'firebase_options.dart';
import 'view/bloc/account/account_cubit.dart';
import 'view/bloc/app/app_cubit.dart';
import 'view/bloc/auth/auth_cubit.dart';
import 'view/bloc/cart/cart_cubit.dart';
import 'view/bloc/chat/chat_cubit.dart';
import 'view/bloc/theme/theme_cubit.dart';

void main() async {
  await _bootstrapping();

  runApp(const Gocery());
}

class Gocery extends StatelessWidget {
  const Gocery({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => AppCubit()),
        BlocProvider(create: (context) => AccountCubit()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => CartCubit()),
      ],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Sizer(builder: (context, orientation, deviceType) {
            return MaterialApp(
              title: 'Gocery',
              debugShowCheckedModeBanner: false,
              themeMode: state.themeMode,
              theme: Style.light,
              darkTheme: Style.dark,
              routes: Routes.list(),
            );
          });
        },
      ),
    );
  }
}

Future<void> _bootstrapping() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Bloc.observer = SimpleBlocObserver();

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
  await _precache();
}

Future<void> _precache() async {
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

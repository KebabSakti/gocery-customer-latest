import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/config/const.dart';
import '../bloc/global/global_cubit.dart';
import '../widget/m_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    final theme = Theme.of(context);
    final screen = MediaQuery.of(context).size;
    final globalCubit = context.read<GlobalCubit>();

    return BlocListener<GlobalCubit, GlobalState>(
      listenWhen: (previous, current) =>
          previous.configModel.authToken != current.configModel.authToken,
      listener: (context, state) {
        if (state.configModel.authToken != null) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(appPage, (route) => false);
        }
      },
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(goceryIconWhite, width: screen.width * 0.5),
                    const SizedBox(height: medium),
                    const Text(
                      '" Belanja keperluan dapur tanpa perlu ke pasar "',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: medium, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                height: 160,
                padding: const EdgeInsets.symmetric(horizontal: large),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MButton(
                      color: Colors.blueAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(FontAwesomeIcons.facebookF),
                          SizedBox(width: small),
                          Text(
                            'Masuk menggunakan Facebook',
                            style: TextStyle(
                              fontSize: medium,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        globalCubit.facebookSignIn();
                      },
                    ),
                    const SizedBox(height: 4),
                    MButton(
                      color: Colors.redAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          FaIcon(FontAwesomeIcons.google),
                          SizedBox(width: small),
                          Text(
                            'Masuk menggunakan Google',
                            style: TextStyle(
                              fontSize: medium,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        globalCubit.googleSignIn();
                      },
                    ),
                    const SizedBox(height: medium),
                    Text(
                      'Dengan melanjutkan, anda telah menyetujui syarat dan ketentuan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 10,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gocery/common/helper/failure.dart';
import 'package:sizer/sizer.dart';

import '../../common/config/const.dart';
import '../../common/helper/utility.dart';
import '../bloc/auth/auth_cubit.dart';
import '../widget/m_button.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    final theme = Theme.of(context);

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.authToken != null) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(appPage, (route) => false);
        }

        if (state.exception != null) {
          showToast((state.exception as BaseFailure).message);
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
                    Image.asset(goceryIconWhite, width: 50.w),
                    SizedBox(height: 2.h),
                    Text(
                      'Belanja keperluan dapur tanpa perlu ke pasar',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),
              Container(
                height: 22.h,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
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
                        children: [
                          const FaIcon(FontAwesomeIcons.facebookF),
                          SizedBox(width: 4.w),
                          Text(
                            'Masuk menggunakan Facebook',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        context.read<AuthCubit>().facebookSignIn();
                      },
                    ),
                    SizedBox(height: 0.5.h),
                    MButton(
                      color: Colors.redAccent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const FaIcon(FontAwesomeIcons.google),
                          SizedBox(width: 4.w),
                          Text(
                            'Masuk menggunakan Google',
                            style: TextStyle(
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        context.read<AuthCubit>().googleSignIn();
                      },
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Dengan melanjutkan, anda telah menyetujui syarat dan ketentuan',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 8.sp,
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

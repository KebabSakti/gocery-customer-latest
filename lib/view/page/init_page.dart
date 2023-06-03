import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/config/const.dart';
import '../bloc/auth/auth_cubit.dart';
import '../bloc/theme/theme_cubit.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    context.read<ThemeCubit>().load();
    context.read<AuthCubit>().load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        final target = state.authToken == null ? authPage : appPage;
        Navigator.of(context).pushNamedAndRemoveUntil(target, (route) => false);
      },
      child: const Scaffold(),
    );
  }
}

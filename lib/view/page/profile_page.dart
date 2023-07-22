import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gocery/common/config/const.dart';
import 'package:gocery/view/bloc/auth/auth_cubit.dart';
import 'package:gocery/view/bloc/theme/theme_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.authToken == null) {
          Navigator.of(context)
              .pushNamedAndRemoveUntil(authPage, (route) => false);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  context.read<ThemeCubit>().toggleTheme();
                },
                child: const Text('Toggle Theme'),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<AuthCubit>().signOut();
                },
                child: const Text('SignOut'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

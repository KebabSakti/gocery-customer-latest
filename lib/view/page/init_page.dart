import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/config/const.dart';
import '../bloc/global/global_cubit.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  @override
  void initState() {
    context.read<GlobalCubit>().load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GlobalCubit, GlobalState>(
      listener: (context, state) {
        final config = state.configModel;
        final target = config.authToken == null ? authPage : appPage;
        Navigator.of(context).pushNamedAndRemoveUntil(target, (route) => false);
      },
      child: const Scaffold(),
    );
  }
}

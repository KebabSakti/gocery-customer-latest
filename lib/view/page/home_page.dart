import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/config/const.dart';
import '../bloc/global/global_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.colorScheme.surface,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: medium),
          child: Container(
            width: double.infinity,
            height: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: theme.colorScheme.primary),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: small),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Cari di sini',
                    style: TextStyle(
                      color: theme.colorScheme.onSurface,
                      fontSize: medium,
                    ),
                  ),
                  FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    color: theme.colorScheme.primary,
                    size: 18,
                  )
                ],
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              //
            },
            icon: badges.Badge(
              position: badges.BadgePosition.topEnd(top: -12, end: -8),
              badgeStyle:
                  badges.BadgeStyle(badgeColor: theme.colorScheme.primary),
              badgeContent: Text(
                '0',
                style: TextStyle(
                  fontSize: small2x,
                  color: theme.colorScheme.onPrimary,
                ),
              ),
              child: FaIcon(
                FontAwesomeIcons.cartShopping,
                color: theme.colorScheme.onSurface,
                size: 20,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: kToolbarHeight,
            width: double.infinity,
            color: theme.colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: medium),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: InputChip(
                      onPressed: () {
                        //
                      },
                      backgroundColor: theme.colorScheme.primary,
                      elevation: 0,
                      pressElevation: 0,
                      label: Text(
                        'INDEX $index',
                        style: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: small,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<GlobalCubit>().signOut();

                Navigator.of(context)
                    .pushNamedAndRemoveUntil(authPage, (route) => false);
              },
              child: const Text('LOGOUT'),
            ),
          ),
        ],
      ),
    );
  }
}

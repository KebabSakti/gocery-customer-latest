import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../bloc/app/app_cubit.dart';
import '../bloc/cart/cart_cubit.dart';
import '../bloc/category/category_cubit.dart';
import '../bloc/chat/chat_cubit.dart';
import 'chat_page.dart';
import 'home_page.dart';
import 'order_page.dart';
import 'profile_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  static const _menus = [
    BottomNavigationBarItem(
      label: 'Home',
      icon: FaIcon(FontAwesomeIcons.house),
    ),
    BottomNavigationBarItem(
      label: 'Order',
      icon: FaIcon(FontAwesomeIcons.fileInvoice),
    ),
    BottomNavigationBarItem(
      label: 'Chat',
      icon: FaIcon(FontAwesomeIcons.solidCommentDots),
    ),
    BottomNavigationBarItem(
      label: 'Profile',
      icon: FaIcon(FontAwesomeIcons.circleUser),
    ),
  ];

  final _pageViewController = PageController();

  Future<void> _init() async {
    context.read<AppCubit>().load();
    context.read<CartCubit>().load();
    context.read<ChatCubit>().init();
  }

  @override
  void initState() {
    _init();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    final theme = Theme.of(context);

    return BlocListener<AppCubit, AppState>(
      listener: (context, state) {
        _pageViewController.jumpToPage(state.pageIndex);
      },
      child: Scaffold(
        body: PageView(
          controller: _pageViewController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            MultiBlocProvider(
              providers: [
                BlocProvider(create: (context) => CategoryCubit()),
              ],
              child: const HomePage(),
            ),
            const OrderPage(),
            const ChatPage(),
            const ProfilePage(),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: theme.dividerColor),
            ),
          ),
          child: BlocSelector<AppCubit, AppState, int>(
            selector: (state) {
              return state.pageIndex;
            },
            builder: (context, state) {
              return BottomNavigationBar(
                onTap: (value) {
                  context.read<AppCubit>().setPageIndex(value);
                },
                backgroundColor: theme.colorScheme.surface,
                elevation: 0,
                items: _menus,
                currentIndex: state,
                showUnselectedLabels: true,
                unselectedItemColor: theme.colorScheme.onSurface,
                selectedItemColor: theme.colorScheme.primary,
                type: BottomNavigationBarType.fixed,
              );
            },
          ),
        ),
      ),
    );
  }
}

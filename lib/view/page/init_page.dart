import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:gocery/common/config/const.dart';

class InitPage extends StatelessWidget {
  const InitPage({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Card(
                color: theme.colorScheme.surface,
                child: Container(
                  height: 100,
                  width: 100,
                  padding: const EdgeInsets.all(large),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eleifend laoreet laoreet.',
                    style: TextStyle(
                      fontSize: medium,
                      color: theme.colorScheme.onSurface,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(small),
            child: ElevatedButton(
              onPressed: () {
                //
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: theme.colorScheme.primary,
                minimumSize: const Size.fromHeight(45),
                shape: const StadiumBorder(),
              ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
              child: Text(
                'Submit to continue',
                style: TextStyle(
                  color: theme.colorScheme.onPrimary,
                  fontSize: medium,
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}

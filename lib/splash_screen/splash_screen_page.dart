import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:princess_solution/splash_screen/splash_screen_notifier.dart';
import 'package:provider/provider.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashScreenNotifier(context),
      child: Consumer<SplashScreenNotifier>(
        builder: (context, value, child) => Scaffold(
          body: Stack(
            children: [
              Image.asset(
                'background.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  maxRadius: 70,
                  backgroundColor: Colors.white,
                  child: ClipOval(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                      child: Image.asset(
                        'logo.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

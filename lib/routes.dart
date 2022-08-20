import 'package:flutter/widgets.dart';
import 'package:flutter_form/screens/home_screen.dart';
import 'package:flutter_form/screens/login_screen.dart';
import 'package:flutter_form/screens/register_screen.dart';

import 'screens/splash_screen.dart';

final Map<String, Widget Function(BuildContext)> app_routes = {
  'home': (BuildContext context) => const HomeScreen(),
  'splash': (BuildContext context) => const SplashScreen(),
  'auth:login': (BuildContext context) => const LoginScreen(),
  'auth:register': (BuildContext context) => const RegisterScreen(),
};

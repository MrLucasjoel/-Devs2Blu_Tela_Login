import 'package:flutter/material.dart';
import '../view/login_view.dart';
import '../view/register_view.dart';
import '../view/home_view.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (_) => const LoginView(),
  '/register': (_) => const RegisterView(),
  '/home': (_) => const HomeView(),
};

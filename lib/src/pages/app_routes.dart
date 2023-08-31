
import 'package:flutter/material.dart';

import 'loading/loading_page.dart';
import 'login/login_page.dart';
class AppRoute {
  static const login = 'login';
  static const loading = 'loading';

  static get all => <String, WidgetBuilder>{
        login: (context) => const LoginPage(),
        loading: (context) => const LoadingPage(),
      };
}
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';
import 'package:thotsakan/src/bloc/auth/auth_bloc.dart';
import 'package:thotsakan/src/pages/app_routes.dart';

import 'constants/network_api.dart';
import 'pages/loading/loading_page.dart';
import 'pages/login/login_page.dart';

final navigatorState = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
 final authBloc = BlocProvider<AuthBloc>(create: (context) => AuthBloc());
    return MultiBlocProvider(
      providers: [
        authBloc,
      ],
      child: MaterialApp(
        title: "Thotsakan",
        routes: AppRoute.all,
        home: _buildInitialPage(),
        navigatorKey: navigatorState,
      ),
    );
  }

  _buildInitialPage() {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LoadingPage();
        }

        // Check if previous state passed authentication?
        final prefs = snapshot.data!;
        final token = prefs.getString(NetworkAPI.token);
        return token == null ? LoginPage() : SizedBox();
      },
    );
  }
}

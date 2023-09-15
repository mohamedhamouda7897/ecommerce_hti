import 'package:ecommerce_hti/features/login/data/data_sources/login_data_source.dart';
import 'package:ecommerce_hti/features/login/presentation/manager/cubit.dart';
import 'package:ecommerce_hti/features/login/presentation/pages/login.dart';
import 'package:ecommerce_hti/features/sign_up/data/data_sources/register_data_source.dart';
import 'package:ecommerce_hti/features/sign_up/presentation/manager/cubit.dart';
import 'package:ecommerce_hti/features/sign_up/presentation/pages/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/splash_screen/presentation/pages/splash_screen.dart';

class Routes {
  static const String splash = "/";
  static const String login = "login";
  static const String signUp = "signUp";
  static const String home = "home";
}

class AppRoutes {
  static Route onGenerate(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
        break;
      case Routes.login:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => LoginCubit(LoginRemoteDataSource()),
              child: LoginScreen()),
        );
        break;
      case Routes.signUp:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
              create: (context) => RegisterCubit(RemoteDataSource()),
              child: Register()),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => unDefineRoute(),
        );
    }
  }

  static Widget unDefineRoute() => Scaffold(
        body: Center(
          child: Text("UnDefine Route"),
        ),
      );
}


import 'package:chatapp/src/views/auth_views/sign_in_view.dart';
import 'package:chatapp/src/views/auth_views/signup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class AppRouter
{


  static  final GoRouter route = GoRouter(routes: [

    GoRoute(
        path: "/",
        builder: (BuildContext context, GoRouterState state)
        {
          return SignupView();
        }
    ),
    GoRoute(
        path: "/signIn",
        builder: (BuildContext context, GoRouterState state)
        {
          return SignInView();
        }
    ),
  ],
  );

}
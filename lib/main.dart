import 'package:chatapp/src/router/app_router.dart';
import 'package:chatapp/src/views/auth_views/signup_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRouter.route.routerDelegate,
      routeInformationProvider: AppRouter.route.routeInformationProvider,
      routeInformationParser: AppRouter.route.routeInformationParser,



    );
  }
}


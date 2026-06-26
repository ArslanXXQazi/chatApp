import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/src/router/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: scaffoldMessengerKey,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      routerDelegate: AppRouter.route.routerDelegate,
      routeInformationProvider: AppRouter.route.routeInformationProvider,
      routeInformationParser: AppRouter.route.routeInformationParser,
    );
  }
}
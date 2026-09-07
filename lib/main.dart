import 'package:flutter/material.dart';
import 'package:tourism_app/models/tourism.dart';
import 'package:tourism_app/screens/details/detail_screen.dart';
import 'package:tourism_app/screens/home/home_screen.dart';
import 'package:tourism_app/static/navigator_routes.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Toursim App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: NavigatorRoutes.homeRoute.name,
      routes: {
        NavigatorRoutes.homeRoute.name: (context) => const HomeScreen(),
        NavigatorRoutes.detailRoute.name: (context) => DetailScreen(
          tourism: ModalRoute.of(context)?.settings.arguments as Tourism,
        ),
      },
    );
  }
}

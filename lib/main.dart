import 'package:flutter/material.dart';
import 'package:tourism_app/models/tourism.dart';
import 'package:tourism_app/screens/bookmark/bookmark_screen.dart';
import 'package:tourism_app/screens/details/detail_screen.dart';
import 'package:tourism_app/screens/home/home_screen.dart';
import 'package:tourism_app/screens/main/main_screen.dart';
import 'package:tourism_app/static/navigator_routes.dart';
import 'package:tourism_app/style/theme/TourismTheme.dart';

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

      theme: TourismTheme.lightTheme,
      darkTheme: TourismTheme.darkTheme,
      themeMode: ThemeMode.system,

      initialRoute: NavigatorRoutes.mainRoute.name,
      routes: {
        NavigatorRoutes.mainRoute.name: (context) => const MainScreen(),
        NavigatorRoutes.detailRoute.name: (context) => DetailScreen(
          tourism: ModalRoute.of(context)?.settings.arguments as Tourism,
        ),
        // NavigatorRoutes.detailRoute.name: (context) => CupertinoWidget(),
        // NavigatorRoutes.mainRoute.name: (context) => MainScreen(),
      },
    );
  }
}
// Namun, Anda akan mendapati kelemahan dari penggunaan setState. Ia tidak cocok untuk diterapkan pada aplikasi dengan skala yang besar. Ketika kita sudah membuat serangkaian widget dengan komponen yang kompleks, setState menjalankan aksi rebuild UI dengan muatan cukup besar.

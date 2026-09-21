import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/data/api/api_service.dart';
import 'package:tourism_app/provider/detail/bookmark_list_provider.dart';
import 'package:tourism_app/provider/detail/tourism_detail_provider.dart';
import 'package:tourism_app/provider/home/tourism_list_provider.dart';
import 'package:tourism_app/screens/details/detail_screen.dart';
import 'package:tourism_app/provider/main/index_nav_provider.dart';
import 'package:tourism_app/screens/main/main_screen.dart';
import 'package:tourism_app/static/navigator_routes.dart';
import 'package:tourism_app/style/theme/TourismTheme.dart';

void main() {
  runApp(
    // 5. Tambahkan ChangeNotifierProvider sebagai parent widget yang menaungi state dalam IndexNavProvider.
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => IndexNavProvider()),

        // 8. Langkah berikutnya adalah memperbaiki kode error yang terjadi di luar detail_screen.dart. Pertama, bukalah berkas main.dart. Ubahlah argumen DetailScreen menjadi seperti berikut.
        ChangeNotifierProvider(create: (context) => BookmarkListProvider()),
        Provider(create: (context) => ApiService()),

        ChangeNotifierProvider(
          create: (context) => TourismListProvider(context.read<ApiService>()),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              TourismDetailProvider(context.read<ApiService>()),
        ),
      ],
      child: MainApp(),
    ),
  );
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
          tourismId: ModalRoute.of(context)?.settings.arguments as int,
        ),
        // NavigatorRoutes.detailRoute.name: (context) => CupertinoWidget(),
        // NavigatorRoutes.mainRoute.name: (context) => MainScreen(),
      },
    );
  }
}
// Namun, Anda akan mendapati kelemahan dari penggunaan setState. Ia tidak cocok untuk diterapkan pada aplikasi dengan skala yang besar. Ketika kita sudah membuat serangkaian widget dengan komponen yang kompleks, setState menjalankan aksi rebuild UI dengan muatan cukup besar.

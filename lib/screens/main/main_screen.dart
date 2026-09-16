import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/screens/bookmark/bookmark_screen.dart';
import 'package:tourism_app/screens/home/home_screen.dart';
import 'package:tourism_app/provider/main/index_nav_provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // 1. Diganti Provider
  // int _indexBottomNavBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: switch (_indexBottomNavBar) {
      //   0 => const HomeScreen(),
      //   _ => const BookmarkScreen(),
      // },

      // 4. Setelah itu, gunakan widget Consumer unutk memperbarui tampilan UI berdasarkan perubahan state.
      body: Consumer<IndexNavProvider>(
        builder: (context, value, child) {
          return switch (value.indexBottomNavBar) {
            1 => const BookmarkScreen(),
            _ => const HomeScreen(),
          };
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        // currentIndex: _indexBottomNavBar,

        // 3. Lalu, ganti nilai currentIndex untuk mendapatkan nilai yang up-to-date dari Provider dengan memanfaatkan extension method watch.
        currentIndex: context.watch<IndexNavProvider>().indexBottomNavBar,

        // 2. Selanjutnya, pada parameter onTap ini isi method menjadi di bawah ini untuk memperbarui state _indexBottomNavBar. Gunakan extension method read untuk memanggil method setIndexBottomNavBar.
        onTap: (index) {
          context.read<IndexNavProvider>().setIndexBottomNavBar = index;

          // setState(() {
          //   _indexBottomNavBar = index;
          // }); DIGANTI PROVIDER
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
            tooltip: 'Bookmark',
          ),
        ],
      ),
    );
  }
}

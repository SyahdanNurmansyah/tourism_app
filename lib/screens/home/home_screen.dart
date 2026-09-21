import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/provider/home/tourism_list_provider.dart';
import 'package:tourism_app/static/navigator_routes.dart';
import 'package:tourism_app/static/tourism_list_result_state.dart';
import 'package:tourism_app/widgets/tourism_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkMode = false;

  @override
  void initState() {
    super.initState();

    // Setelah itu, kita beralih ke berkas home_screen.dart. Kita perlu memanggil TourismListProvider untuk memuat data ke internet. Jadi, tambahkan perintah untuk memanggil fungsi pada TourismListProvider dalam initState.
    Future.microtask(() {
      context.read<TourismListProvider>().fetchTourismList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tourism List'),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isDarkMode = !_isDarkMode;
              });
            },

            icon: Icon(
              _isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode,
            ),
          ),
        ],
      ),

      // Kemudian, ubahlah widget ListView menjadi komentar menggunakan shortcut CTRL + / atau CMD + /. Widget ini akan dipakai sebagai acuan untuk membuat FutureBuilder. Jadi, jangan dihapus terlebih dahulu.

      // Kemudian, ubah susunan widget FutureBuilder menjadi Consumerseperti berikut. Hal ini untuk menggantikan konsep FutureBuilder dengan memanfaatkan state management Provider.
      body: Consumer<TourismListProvider>(
        builder: (context, value, child) {
          return switch (value.resultState) {
            TourismListLoadingState() => const Center(
              child: CupertinoActivityIndicator(),
            ),
            TourismListLoadedState(data: var tourismList) => ListView.builder(
              itemCount: tourismList.length,
              itemBuilder: (context, index) {
                final tourism = tourismList[index];

                return TourismCardWidget(
                  tourism: tourism,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NavigatorRoutes.detailRoute.name,
                      arguments: tourism.id,
                    );
                  },
                );
              },
            ),

            TourismListErrorState(error: var message) => Center(
              child: Text(message),
            ),
            _ => const SizedBox(),
          };
        },
      ),
    );
  }
}

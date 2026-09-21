import 'package:flutter/material.dart';
import 'package:tourism_app/data/api/api_service.dart';
import 'package:tourism_app/data/models/tourism_list_response.dart';
import 'package:tourism_app/static/navigator_routes.dart';
import 'package:tourism_app/widgets/tourism_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkMode = false;
  late Future<TourismListResponse> _futureTourismResponse;

  @override
  void initState() {
    super.initState();
    _futureTourismResponse = ApiService().getTourismList();
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

      // body: ListView.builder(
      //   itemCount: tourismList.length,
      //   itemBuilder: (context, index) {
      //     final tourism = tourismList[index];
      //     return TourismCardWidget(
      //       tourism: tourism,
      //       onTap: () {
      //         Navigator.pushNamed(
      //           context,
      //           NavigatorRoutes.detailRoute.name,
      //           arguments: tourism,
      //         );
      //       },
      //     );
      //   },
      // ),

      // Kemudian, ubahlah widget ListView menjadi komentar menggunakan shortcut CTRL + / atau CMD + /. Widget ini akan dipakai sebagai acuan untuk membuat FutureBuilder. Jadi, jangan dihapus terlebih dahulu.
      body: FutureBuilder(
        future: _futureTourismResponse,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CircularProgressIndicator());

            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              }

              final listOfTourism = snapshot.data!.places;
              return ListView.builder(
                itemCount: listOfTourism.length,
                itemBuilder: (context, index) {
                  final tourism = listOfTourism[index];
                  return TourismCardWidget(
                    tourism: tourism,
                    onTap: () {
                      // 9. Kemudian, buka berkas home_screen.dart. Perbaiki juga argumen pada DetailScreen menjadi seperti berikut.

                      Navigator.pushNamed(
                        context,
                        NavigatorRoutes.detailRoute.name,
                        arguments: tourism.id,
                      );
                    },
                  );
                },
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

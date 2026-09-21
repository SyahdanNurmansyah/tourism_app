import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/data/api/api_service.dart';
import 'package:tourism_app/data/models/tourism.dart';
import 'package:tourism_app/data/models/tourism_detail_response.dart';
import 'package:tourism_app/provider/icon/bookmark_icon_provider.dart';
import 'package:tourism_app/screens/details/body_of_detail_screen_widget.dart';
import 'package:tourism_app/widgets/bookmark_icon_widget.dart';

// Menambahkan FutureBuilder di DetailScreen
// 1. Ubah widget jadi StatefulWidget
class DetailScreen extends StatefulWidget {
  // 2. Untuk mengakses API, kita memerlukan satu parameter saja, yaitu id wisata. Kita tidak membutuhkan parameter lain untuk menampilkan halaman detail karena akan ditangani oleh Web API.

  final int tourismId;
  const DetailScreen({super.key, required this.tourismId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // 3. Berikutnya, beri lokal variabel untuk menyimpan objek Future dan Completer.

  // Objek Future akan dipanggil untuk mendapatkan data Tourism dari ApiService. Sedangkan objek Completer aka nmenunggu data Tourism dari objek Future.
  final Completer<Tourism> _completerTourism = Completer<Tourism>();
  late Future<TourismDetailResponse> _futureTourismDetail;

  // 4. Definisikan lokal variabel _futureTourismDetail pada method initState.
  @override
  void initState() {
    super.initState();
    _futureTourismDetail = ApiService().getDetailTourism(widget.tourismId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Screen'),
        actions: [
          ChangeNotifierProvider(
            create: (context) => BookmarkIconProvider(),

            // 5. Selanjutnya, bungkus widget BookmarkIconWidget dengan FutureBuilder.
            child: FutureBuilder(
              future: _completerTourism.future,
              builder: (context, snapshot) {
                return switch (snapshot.connectionState) {
                  ConnectionState.done => BookmarkIconWidget(
                    tourism: snapshot.data!,
                  ),

                  _ => const SizedBox(),
                };
              },
            ),
          ),
        ],
      ),

      // 6. Kemudian, fokus pada widget SingleChildScrollView. Anda bisa membuat widget tersebut menjadi widget baru dan beri nama BodyOfDetailScreenWidget

      // 7. Lalu, bungkus widget BodyOfDetailScreenWidget dengan FutureBuilder. Sisipkan juga completer untuk mendapatkan akses tourismData ke _completerTourism.
      body: FutureBuilder(
        future: _futureTourismDetail,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(child: CupertinoActivityIndicator());

            case ConnectionState.done:
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              final tourismData = snapshot.data!.place;
              _completerTourism.complete(tourismData);
              return BodyOfDetailScreenWidget(tourism: tourismData);

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}

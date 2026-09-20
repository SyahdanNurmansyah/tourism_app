import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tourism_app/provider/detail/bookmark_list_provider.dart';
import 'package:tourism_app/static/navigator_routes.dart';
import 'package:tourism_app/widgets/tourism_card_widget.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookmark List')),

      // 1. Ambil data bookmarkList melalui parameter valueConsumer
      body: Consumer<BookmarkListProvider>(
        builder: (context, value, child) {
          final bookmarkLists = value.bookmarkList;

          // 3. Jangan lupa untuk mengaganti sumber daftar bookmark dengan variabel bookmarkList yang berasal dari BookmarkListProvider.

          return switch (bookmarkLists.isNotEmpty) {
            true => ListView.builder(
              itemCount: bookmarkLists.length,
              itemBuilder: (context, index) {
                final tourism = bookmarkLists[index];

                // 2. Setelah bookmarkList didapatkan, Anda bisa memanfaatkannya untuk memeriksa nilainya koosng atau tidak. Apabila ada isinya, Anda bisa menampilkan ListView. Sebaliknya, bisa menampilkan informasi tidak ada item yang tercatat.

                return TourismCardWidget(
                  tourism: tourism,
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      NavigatorRoutes.detailRoute.name,
                      arguments: tourism,
                    );
                  },
                );
              },
            ),

            _ => const Center(child: Text('No bookmark nyet')),
          };
        },
      ),
    );
  }
}

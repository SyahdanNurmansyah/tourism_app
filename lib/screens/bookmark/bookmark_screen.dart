import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/models/tourism.dart';
import 'package:tourism_app/static/navigator_routes.dart';
import 'package:tourism_app/widgets/tourism_card_widget.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bookmark List')),

      body: ListView.builder(
        itemCount: bookmarkTourismList.length,
        itemBuilder: (context, index) {
          final tourism = bookmarkTourismList[index];
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tourism_app/models/tourism.dart';
import 'package:tourism_app/static/navigator_routes.dart';
import 'package:tourism_app/widgets/tourism_card_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isDarkMode = false;

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
      body: ListView.builder(
        itemCount: tourismList.length,
        itemBuilder: (context, index) {
          final tourism = tourismList[index];
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

import 'package:flutter/material.dart';
import 'package:tourism_app/models/tourism.dart';
import 'package:tourism_app/widgets/tourism_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tourism List')),
      body: ListView.builder(
        itemCount: tourismList.length,
        itemBuilder: (context, index) {
          final tourism = tourismList[index];
          return TourismCardWidget(tourism: tourism);
        },
      ),
    );
  }
}

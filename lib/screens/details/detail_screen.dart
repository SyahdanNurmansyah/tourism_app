import 'package:flutter/material.dart';
import 'package:tourism_app/constants/app_constants.dart';
import 'package:tourism_app/models/tourism.dart';

class DetailScreen extends StatelessWidget {
  final Tourism tourism;
  const DetailScreen({super.key, required this.tourism});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: Column(
            children: [
              Image.network(tourism.image, fit: BoxFit.cover),
              const SizedBox.square(dimension: 16),
              Row(
                mainAxisAlignment: .spaceBetween,
                crossAxisAlignment: .center,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(tourism.name, style: AppConstants.headingStyle),
                        Text(tourism.address, style: AppConstants.bodyStyle),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.favorite_rounded),
                      const SizedBox.square(dimension: 4),
                      Text(tourism.like.toString()),
                    ],
                  ),
                ],
              ),

              const SizedBox.square(dimension: 16),
              Text(tourism.description),
            ],
          ),
        ),
      ),
    );
  }
}

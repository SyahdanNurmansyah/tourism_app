import 'package:flutter/material.dart';
import 'package:tourism_app/constants/app_constants.dart';

import 'package:tourism_app/data/models/tourism.dart';

class BodyOfDetailScreenWidget extends StatelessWidget {
  final Tourism tourism;
  const BodyOfDetailScreenWidget({super.key, required this.tourism});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          children: [
            Hero(
              tag: tourism.image,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(tourism.image, fit: BoxFit.cover),
              ),
            ),
            const SizedBox.square(dimension: 16),
            Card(
              shadowColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  spacing: 8,
                  mainAxisAlignment: .spaceBetween,
                  crossAxisAlignment: .center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(tourism.name, style: AppConstants.titleStyle),
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
              ),
            ),

            const SizedBox.square(dimension: 16),
            Card(
              shadowColor: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(tourism.description, style: AppConstants.bodyStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

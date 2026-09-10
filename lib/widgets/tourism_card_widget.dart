import 'package:flutter/material.dart';
import 'package:tourism_app/constants/app_constants.dart';
import 'package:tourism_app/models/tourism.dart';

class TourismCardWidget extends StatelessWidget {
  final Tourism tourism;
  final Function() onTap;
  const TourismCardWidget({
    super.key,
    required this.tourism,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Row(
          spacing: 12,
          crossAxisAlignment: .start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 120,
                  maxWidth: 120,
                  minHeight: 80,
                  maxHeight: 80,
                ),
                child: Image.network(tourism.image, fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    tourism.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  Row(
                    spacing: 6,
                    children: [
                      Icon(Icons.pin_drop, size: 14),
                      Expanded(
                        child: Text(
                          tourism.address,
                          style: AppConstants.bodyStyle.copyWith(fontSize: 12),
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox.square(dimension: 8),
                  Row(
                    spacing: 6,
                    children: [
                      Icon(Icons.favorite_rounded, size: 18, color: Colors.red),
                      Text(
                        tourism.like.toString(),
                        style: AppConstants.bodyStyle.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

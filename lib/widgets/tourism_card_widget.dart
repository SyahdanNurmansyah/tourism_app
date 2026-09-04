import 'package:flutter/material.dart';
import 'package:tourism_app/constants/app_constants.dart';
import 'package:tourism_app/models/tourism.dart';

class TourismCardWidget extends StatelessWidget {
  final Tourism tourism;
  const TourismCardWidget({super.key, required this.tourism});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(tourism.name, style: AppConstants.titleStyle),
          Text(
            tourism.description,
            style: AppConstants.bodyStyle,
            maxLines: 3,
            softWrap: true,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tourism_app/constants/app_constants.dart';
import 'package:tourism_app/data/models/tourism.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 16),
        child: Card(
          shadowColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              spacing: 12,
              crossAxisAlignment: .start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minWidth: 120,
                      maxWidth: 140,
                      minHeight: 80,
                      maxHeight: 100,
                    ),
                    child: Hero(
                      curve: Curves.easeInOut,
                      tag: tourism.image,
                      child: Image.network(
                        tourism.image,
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(child: CupertinoActivityIndicator());
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(
                              Icons.wifi_off_outlined,
                              color: Colors.red,
                            ),
                          );
                        },
                      ),
                    ),
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
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        spacing: 6,
                        children: [
                          Icon(Icons.pin_drop, size: 14),
                          Expanded(
                            child: Text(
                              tourism.address,
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(fontSize: 11),
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox.square(dimension: 8),
                      Row(
                        spacing: 6,
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            size: 18,
                            color: Colors.red,
                          ),
                          Text(
                            tourism.like.toString(),
                            style: AppConstants.bodyStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

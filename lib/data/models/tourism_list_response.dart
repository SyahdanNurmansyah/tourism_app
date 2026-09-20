// 2. Data pertama berisi key error, message, count, dan places.

import 'package:tourism_app/data/models/tourism.dart';

class TourismListResponse {
  final bool error;
  final String message;
  final int count;
  final List<Tourism> places;

  TourismListResponse({
    required this.error,
    required this.message,
    required this.count,
    required this.places,
  });

  // Berikutnya adalah menambahkan method factory fromJson untuk mendekomposisi data JSON. Pastikan nama argumen sudah sesuai dengan nama key pada data JSON sebelumnya,
  factory TourismListResponse.fromJson(Map<String, dynamic> json) {
    return TourismListResponse(
      error: json["error"],
      message: json["message"],
      count: json["count"],
      places: json["places"] != null
          ? List<Tourism>.from(json["places"]!.map((x) => Tourism.fromJson(x)))
          : <Tourism>[],
    );
  }
}

// Tahapan formatting respons Web API untuk endpoint pertama sudah selesai.

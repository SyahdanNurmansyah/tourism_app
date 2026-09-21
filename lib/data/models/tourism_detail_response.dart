// Formatting Respons Web API untuk Endpoint Kedua

// 1. Endpoint berikutnya, yaitu “/detail”. Ia mengandung key error, message, dan place. Objek berikutnya berisi daftar key, yaitu id, name, description, dll., layaknya objek kelas Tourism.
import 'package:tourism_app/data/models/tourism.dart';

class TourismDetailResponse {
  final bool error;
  final String message;
  final Tourism place;

  TourismDetailResponse({
    required this.error,
    required this.message,
    required this.place,
  });

  // 2. Tambahkan method factory fromJson untuk mendekomposisi data JSON menjadi objek kelas TourismDetailResponse

  factory TourismDetailResponse.fromJson(Map<String, dynamic> json) {
    return TourismDetailResponse(
      error: json["error"],
      message: json["message"],
      place: Tourism.fromJson(json["place"]),
    );
  }

  // 3. Next, buka berkas api_services.dart dalam folder data → api. Tambahkan method baru untuk mengakses endpoint “/detail”.
}

// Buat fungsi untuk mengakses endpoint /list dan beri responsnya dengan mengembalikan niai Future<TourismListRespons>
// Berikan variabel konstanta bernama _baseUrl untuk basis URL Tourism API.

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tourism_app/data/models/tourism_list_response.dart';

class ApiService {
  static const String _baseUrl = 'https://tourism-api.dicoding.dev';

  Future<TourismListResponse> getTourismList() async {
    final response = await http.get(Uri.parse("$_baseUrl/list"));

    if (response.statusCode == 200) {
      return TourismListResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load tourism list');
    }
  }
}

// Tahapan mengonfigurasi API service sudah berakhir.

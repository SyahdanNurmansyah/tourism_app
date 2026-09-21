import 'package:flutter/material.dart';
import 'package:tourism_app/data/api/api_service.dart';
import 'package:tourism_app/static/tourism_list_result_state.dart';

class TourismListProvider extends ChangeNotifier {
  // 1. Sisipkan objek ApiServices. Objek ini akan digunakan untuk memanggil method ApiServices guna mengakses Web API.

  final ApiService _apiService;

  TourismListProvider(this._apiService);

  // 2. Tambahkan variabel state dan getter-nya agar mudah mengakses dari luar kelas.

  TourismListResultState _resultState = TourismListNoneState();

  TourismListResultState get resultState => _resultState;

  // 3. Selanjutnya, beri fungsi untuk memuat proses asinkron dari Web API. Tambahkan try-catchsebagai blok untuk menangkap error bila terjadi kesalahan pada prosesnya.

  Future<void> fetchTourismList() async {
    try {
      _resultState = TourismListLoadingState();
      notifyListeners();

      final result = await _apiService.getTourismList();

      if (result.error) {
        _resultState = TourismListErrorState(result.message);
        notifyListeners();
      } else {
        _resultState = TourismListLoadedState(result.places);
        notifyListeners();
      }
    } on Exception catch (e) {
      _resultState = TourismListErrorState(e.toString());
      notifyListeners();
    }
  }
}

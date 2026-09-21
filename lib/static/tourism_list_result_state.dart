// Latihan Penambahan Tourism API dengan Provider

// Tahapan selanjutnya adalah membuat state. State ini digunakan untuk menyimpan hasil respons Web API. Pertama, buat berkas bernama tourism_list_result_state.dart dalam folder static. Kemudian, buat sealed class bernama TourismListResultState. Kelas ini akan menjadi basic state untuk menyimpan daftar wisata dari endpoint “/list”.

import 'package:tourism_app/data/models/tourism.dart';

sealed class TourismListResultState {}
// 2. Berikutnya, tambahkan state lain untuk menagnani beberapa kondisi poses asinkron, seperti:
// - idle (diam)
// - loading
// - completed with error
// - completed with data

class TourismListNoneState extends TourismListResultState {}

class TourismListLoadingState extends TourismListResultState {}

class TourismListErrorState extends TourismListResultState {
  final String error;
  TourismListErrorState(this.error);
}

class TourismListLoadedState extends TourismListResultState {
  final List<Tourism> data;

  TourismListLoadedState(this.data);
}

import 'package:flutter/widgets.dart';
import 'package:tourism_app/models/tourism.dart';

class BookmarkListProvider with ChangeNotifier {
  // Tambahkan state baru bernama _bookmarkListyang berisi list kosong. State ini akan menampung daftar item yang telah tercatat pada fitur bookmark.

  final List<Tourism> _bookmarkList = [];

  // Kemudian, buat method getter untuk mendapatkan nilai state.
  List<Tourism> get bookmarkList => _bookmarkList;

  // Anda perlu mengetahui beberapa hal terkait bookmark bookmark. Anda perlu mengelolanya dengan cara menambah, menghapus, dan memeriksa item bookmark. Untuk itu, kita memerlukan tiga method baru untuk menangani proses tersebut.

  void addBookmark(Tourism value) {
    _bookmarkList.add(value);
    notifyListeners();
  }

  void removeBookmark(Tourism value) {
    _bookmarkList.removeWhere((element) => element.id == value.id);
    notifyListeners();
  }

  bool checkItemBookmark(Tourism value) {
    final tourismInList = _bookmarkList.where(
      (element) => element.id == value.id,
    );

    return tourismInList.isNotEmpty;
  }
}

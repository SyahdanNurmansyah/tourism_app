//  MENAMBAHKAN BOOKMARKLISTPROVIDER

import 'package:flutter/cupertino.dart';
import 'package:tourism_app/models/tourism.dart';

class BookmarkListProvider extends ChangeNotifier {
  // 1. Tambahkan state bernama _bookmarkList yang berisi list kosong.
  final List<Tourism> _bookmarkList = [];

  // 2. Buat geeter untuk mendapatkan nilai state.
  List<Tourism> get bookmarkList => _bookmarkList;

  // 3. Perlu tiga method unutk mengelolanya dengan cara meambabh, menghapus, dan memeriksa item bookmark.

  void addBookmark(Tourism value) {
    _bookmarkList.add(value);
    notifyListeners();
  }

  void removeBookmark(Tourism value) {
    _bookmarkList.removeWhere((element) => element.id == value.id);
    notifyListeners();
  }

  bool checkItemBookmark(Tourism value) {
    final tourismList = _bookmarkList.where(
      (element) => element.id == value.id,
    );
    return tourismList.isNotEmpty;
  }
}

// Kode BookmarkListProvider sudah beres. Sekarang beralih ke berkash bookmark_screen.dart

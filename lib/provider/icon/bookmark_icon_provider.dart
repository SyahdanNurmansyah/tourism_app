// MENAMBAHKAN BOOKMARKICONPROVIDER

// BookmarkIconProvider: Provider ini berguna untuk menangani state boolean true/false saat ikon ditekan.

import 'package:flutter/cupertino.dart';

class BookmarkIconProvider extends ChangeNotifier {
  // 1. Tambahkan state _isBookmarked untuk menangani boolean. Kita bisa atur nilainya dimulai dari false. Nilai awal ini ditentukan ketika tampilan UI pada DetailScreen dimulai dari unchecked atau false.

  bool _isBookmarked = false;
  bool get isBookmarked => _isBookmarked;

  set isBookmarked(bool value) {
    _isBookmarked = value;
    notifyListeners();
  }
}

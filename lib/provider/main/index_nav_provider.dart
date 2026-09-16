import 'package:flutter/material.dart';

class IndexNavProvider with ChangeNotifier {
  int _indexBottomNavBar = 0;

  // Kemudian, beri method getter-setter untuk mengakses dan memperbarui nilai state _indexBottomNavBar. Jangan lupakan method notifyListener() supaya perubahan dapat didengar oleh widget.

  int get indexBottomNavBar => _indexBottomNavBar;
  set setIndexBottomNavBar(int value) {
    _indexBottomNavBar = value;
    notifyListeners();
  }
}
